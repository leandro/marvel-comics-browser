# Marvel Comics Browser

Hello! 👋

This is a merely rails project intended to display Marvel comic books, where the
user is able to filter comics by characters and to bookmark his/her favorite
ones.

The purpose here is to be a very simple project, so there is no user managment,
which means no user registration nor user sign-in. The user data is saved in
session storage (or modern HTML5 API LocalStorage).

## TO-DO

- [ ] Implement cache for API requests
- [ ] Implement bookmarking feature
- [ ] Treat errors, like comics not found for a given character
- [ ] Implement unit/integration/acceptance tests
- [ ] Display pagination details (total entries found and pagination info)
- [ ] Adjust design for mobile resolutions
- [ ] Change list title according to the current action (w/o search query)
- [ ] Internationalize all the expressions present in the UI
