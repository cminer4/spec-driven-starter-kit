# Feature: User Authentication

## Status

Draft

## Summary

Allow users to register, log in, and log out using email and password credentials.

## Motivation

The application needs a way to identify users and protect access to personalized resources.

## Requirements

### Registration

- Users register with an email address and password.
- Email must be unique across all accounts.
- Password must be at least 8 characters.
- On success, the user receives a confirmation and is logged in automatically.
- On failure, the user receives a clear error message (e.g., "Email already in use").

### Login

- Users log in with their registered email and password.
- On success, a session is created and the user is redirected to the dashboard.
- On failure, a generic error is shown ("Invalid email or password") to avoid leaking account existence.
- Sessions expire after 24 hours of inactivity.

### Logout

- Users can log out from any authenticated page.
- On logout, the session is invalidated and the user is redirected to the login page.

## Edge Cases

- Submitting the registration form with an already-registered email.
- Submitting login with correct email but wrong password.
- Accessing a protected route with an expired session.
- Concurrent login from multiple devices (allowed — each gets its own session).

## Out of Scope

- OAuth / social login (future feature).
- Multi-factor authentication (future feature).
- Password reset flow (separate spec).

## Open Questions

- Should we rate-limit failed login attempts? If so, what threshold?
