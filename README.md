#  Ahead-Of-Time Compilation for Torch.Export-ed Models

## Requirements
Define a path to the `CMAKE_PREFIX_PATH` variable to locate the LibTorch library. 

## Step 1: Generate the Model
Use script `compile_model_polaris.sh`. this will give you a new shared object `model.so`

## Step 2: Build the inference executable
Use script `infer_model_polaris.sh` to build the inference executable. This will also move previously created shared library to the `build` directory.

## Running the executable
`aoti_example` binary has been generated in the `build` directory, executing it will display results akin to the following:

```
$ ./aoti_example
Result from the first inference:
0.4866
0.5184
0.4462
0.4611
0.4744
0.4811
0.4938
0.4193
[ CUDAFloatType{8,1} ]
Result from the second inference:
0.4883
0.4703
[ CUDAFloatType{2,1} ]
```

## References
- [PyTorch AOTI](https://pytorch.org/docs/main/torch.compiler_aot_inductor.html)
- [PyTorch export](https://pytorch.org/docs/main/export.html#torch-export)
