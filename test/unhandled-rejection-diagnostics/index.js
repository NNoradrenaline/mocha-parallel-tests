#!/usr/bin/env node

const { setProcessExitListeners } = require('../../dist/util');

setProcessExitListeners();

Promise.reject({
    diagnosticText: "tests/data.ts(9,41): error TS2551: Property 'atricle1' does not exist",
    diagnosticCodes: [2551],
});
