const keycloak = require('../src/services/keycloak.service');
const token = "bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJnX3Y2bEFmaFlkM3l0cm5ubkEzUnVTN1N3NkJyT3VQUjk3cmdwanZtbWtFIn0.eyJleHAiOjE2OTc3MDkzMjksImlhdCI6MTY2NjE3MzMyOSwianRpIjoiMDMyOGUxODMtN2ViZS00NGQwLTg0NmUtOGZlM2Q1OTU2NzU2IiwiaXNzIjoiaHR0cDovLzMuNy41Ny4yNDQvYXV0aC9yZWFsbXMvc3VuYmlyZC1yYyIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiJlZDEzZjFlMS00MzY2LTQwOTQtOTVmOC1jOTZhMjcwNWJiYWEiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJyZWdpc3RyeS1mcm9udGVuZCIsInNlc3Npb25fc3RhdGUiOiJhOTY0ZGY2Ny02ZjJlLTRjMGMtYmFiNS0wMDhiZTk5M2JlNzkiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vbG9jYWxob3N0OjQyMDIiLCJodHRwOi8vbG9jYWxob3N0OjQyMDIiLCJodHRwczovL2xvY2FsaG9zdDo0MjAwIiwiaHR0cHM6Ly9uZGVhci54aXYuaW4iLCJodHRwOi8vbG9jYWxob3N0OjQyMDAiLCJodHRwOi8vbmRlYXIueGl2LmluIiwiaHR0cHM6Ly9zdW5iaXJkLWNlcnRpZmljYXRlLWRlbW8ueGl2LmluIiwiaHR0cDovLzIwLjE5OC42NC4xMjgiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImEyM0BtYWlsLmNvbS1yZWFsbS1yb2xlIiwib2ZmbGluZV9hY2Nlc3MiLCJhZG1pbiIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1uZGVhciJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsInNpZCI6ImE5NjRkZjY3LTZmMmUtNGMwYy1iYWI1LTAwOGJlOTkzYmU3OSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicHJlZmVycmVkX3VzZXJuYW1lIjoiYTIzQG1haWwuY29tIiwiZW50aXR5IjpbIlRlbmFudCJdLCJlbWFpbCI6ImEyM0BtYWlsLmNvbSJ9.TlMnxMCGox9Isxqe49kVD3KUGXZRbLXsqhHHowwx9Yrs27194MROwDKyKITmXrJKOaJgtSFZ396my46DSLRhpICYwN0gS-5AdY16E8asn6pco5k7yUxciro8JNkIQEb2zYAqHvHK-Tk6qJv8MaCXwV9qx14mAWTQfkiOkwSkbgZfed9qd5sWGZcD-bN59qKxesD4exfyXeXn7KFZRrSBlbgeok9DokAlRPNRBVQl65MKoU66GX2cVjiOGcWoJWZAfsBZRt_PSZpdVGiYnLQmy1OYON3nJmWWwVlWPQqC4Ulzi1UGuWiMDOYz_ll96Oy7M52l8Vo1EUwWLQpaPF-P4g";
const owner = "ed13f1e1-4366-4094-95f8-c96a2705bbaa"
test("Should decode and get OS owner from bearer token", async() => {
    
    const sub = keycloak.getOsOwner(token);
    expect(sub).toEqual(owner);

})