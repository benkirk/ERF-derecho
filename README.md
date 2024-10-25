# Building & Running ERF on Derecho

## Quickstart
```pre
./build.sh
cd cases/ABL
PBS_ACCOUNT=<my_account> make run
```

## Details
### Environment
The file `config_env.sh` defines the module selection and some path conveniences.

### Compiling
The script `build.sh` will clone ERF (if necessary), configure via `cmake` , and compile.

### Running
The regression test suite is run from the PBS script `test.pbs`. A couple examples are inside the `cases/` directory.
