# Multi-Stage CDC Synchronizer

Two- and three-stage flip-flop synchronizers for safely transferring a single-bit signal between asynchronous clock domains.

## Overview

When a signal crosses between unrelated clock domains, the receiving flip-flop can go metastable if the input changes near the active clock edge. Cascading flip-flops reduces the probability of metastability propagating into the destination logic.

## Files

| File | Description |
|------|-------------|
| `sync2_stage.v` | Two-stage synchronizer |
| `sync3_stage.v` | Three-stage synchronizer |
| `sync_tb.v` | Testbench |

## Simulation

Compile and run `sync_tb.v` with a Verilog simulator. A waveform (`sync_tb.vcd`) is included from a reference run.

## License

MIT - see [LICENSE](LICENSE).
