# kernel NVMe systemtap scripts

This directory contains few generic systemtap scripts to help out
with debugging of what is happening inside kernel NVMe driver.

`*-stacktrace.stp` scripts supply stacktrace of NVMe-related functions
for host(`nvme`) and target(`nvmet`) driver respectively.

`tapset` folder contains reusable code fragments which may serve as
somewhat of an example of how to take out driver's guts mostly purely
based on DWARF information and only some publicly-available headers.

Since documentation on `systemtap` is scarse on details,
this folder contains some of the knowledge on how to tame it.

## Why?

Tracepoint in NVMe driver provide little information and ever more, `trace-cmd`
seems to have a hard time decoding results even while
`/sys/kernel/debug/tracing/trace` works fine.
Plus it's a fine example on understand what's happening inside the drivers
with ability to add-in custom debug points on the fly without hardcore `C`
or driver's recompilation.
And most important of all - debugging of I/O errors.

## Usage

Just put executable bit on one of the `*.stp` files in this directory
and execute it. It seems that `stap` arguments get passed along in such case,
for example output might be redirected to a file by passing `-o`.

## Issues

- It is unclear on how to specify MOFED `ofa_kernel` sources for the `systemtap`
and thus `C` code might bug out on missing fields in some structures.
- It seems to be from hard to impossible include private driver headers
- Plenty of `sprintf`'s on each command running inside the driver might
slow down performance and thus harden debugging of cases which require
quick I/O to reproduce
- The code ain't very pretty but roughly logically organized
