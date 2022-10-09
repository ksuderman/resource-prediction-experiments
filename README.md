# Resource Prediction Experiments
ABM benchmark and experiment definitions used in the Usage Metering project to generate cpu and memory usage statistics.

## Benchmarks

The `benchmarks` directory contains the benchmark configuration files for `hg38` and `chm13` using the 1x, 10x, and 30x datasets.  The benchmark configuration files can be generated using the `benchmark.j2` template and the `render_template.py` program (link needed):

```
python3 render_template.py --template benchmark.j2 size=10x genome=chm13
```

## Experiments

The `experiments` directory contains the definitions for the experments defined in the [benchmarking plan](https://docs.google.com/spreadsheets/d/1NpUzi7wMoKgg3lapBfS7yTx2oAnDJfzvurb-Zyw4yTI/edit#gid=1819322787).

### Test A

#### Purpose
1. Tool scalability
1. Intel vs. AMD CPUs
1. Peak mem usage for tool and scale, given the same input & ref
1. Provider
1. GCP instance class (n2 vs e2)

#### Plan

Run the `hg38` workflow with the Human DNA 10x dataset on the the AWS clusters (m6a and m6i) and the GCP cluster (n2-standard) with the following  CPU and memory configurations

| CPU | Memory |
|-----|--------|
| 4 | 16 |
| 8 | 32 |
| 16 | 64 |
| 32 | 128 |

### Test B

#### Purpose

Impact reference genome size has on tool: 
1. memory consumption and
1. runtime

#### Plan

Run the `hg38` and `chm13` (chicken and locust coming soon) 1x datasets on an AWS m6i 16x64 cluster.

### Test C
#### Purpose
Impact input size has on tool:
1. runtime, 
1. memory consumption
1. size of output

#### Plan

Run the `hg38` workflow on the  1x, 10x, and 30x datasets on and AWS m6i 16x64 cluster.

### Test D

#### Purpose
Impact memory-to-CPU ratio has on:
1. tool runtime and
1.  memory consumption

#### Plan
Run the `hg38` workflow on the 10x dataset on AWS `m6i`, `r6i`, and `c6i` cluster types with 4x8, 4x16, and 4x32 CPU and memory configurations.