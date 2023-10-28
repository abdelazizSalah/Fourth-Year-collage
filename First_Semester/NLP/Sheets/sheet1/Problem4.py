def get_stats(vocab):
    """
    Get frequency of pairs of consecutive characters in the vocabulary.
    """
    pairs = {}
    for word, freq in vocab.items():
        symbols = word.split()
        for i in range(len(symbols) - 1):
            pair = (symbols[i], symbols[i + 1])
            pairs[pair] = pairs.get(pair, 0) + freq
    return pairs


def merge_vocab(pair, vocab):
    """
    Merge the most frequent pair of consecutive characters in the vocabulary.
    """
    new_vocab = {}
    bigram = ' '.join(pair)
    replacement = ''.join(pair)
    for word in vocab:
        updated_word = word.replace(bigram, replacement)
        new_vocab[updated_word] = vocab[word]
    return new_vocab


def byte_pair_encoding(vocab, num_merges):
    """
    Perform Byte Pair Encoding tokenization on the given vocabulary for a certain number of iterations.
    """
    for i in range(num_merges):
        pairs = get_stats(vocab)
        if not pairs:
            break
        best_pair = max(pairs, key=pairs.get)
        vocab = merge_vocab(best_pair, vocab)
    return vocab


# Sample vocabulary
vocab = {"l o w </w>": 5, "l o w e s t </w>": 2,
         "n e w e r </w>": 6, "w i d e r </w>": 3, "n e w </w>": 2, }

# Number of merge operations to perform
num_merges = 5

# Perform Byte Pair Encoding tokenization
tokenized_vocab = byte_pair_encoding(vocab, num_merges)

# Print tokenized vocabulary
print("Tokenized Vocabulary:")
for token, freq in tokenized_vocab.items():
    print(f"{token}: {freq}")
