/// @author Abdelaziz Salah
/// @date 20/11/2023
/// this is a file contaning the constant baseURL and the endpoints of the API

const baseUrl =
    'https://91b89e87-407b-4eda-a04d-36c13c437f1c.mock.pstmn.io'; // mock server.
// 'https://b6dd0175-1a73-4586-aeca-2b3abf122a4d.mock.pstmn.io'; // mock server.

//? user data
const noToken = 'noToken';
const noRole = 'noRole';
var role = noRole;
var token = noToken;
const getHome = '/home/view';
const profile =
    '/api/v1/user/profile/{username}'; // username should be dynamic.
const signUp = '/api/v1/auth/register';
const logIn = '/api/v1/auth/authenticate';
// const getHome = '/home/view';
