#include <iostream>
#include <filesystem>
#include <vector>

#include <torch/torch.h>
#include <torch/csrc/inductor/aoti_runner/model_container_runner_cuda.h>

int main() {
    std::string shared_object_name = "model.so";
    std::filesystem model_so_path = std::filesystem::current_path();
    model_so_path /= shared_object_name;
    std::string model_so_path_string = model_so_path.strin();
    c10::InferenceMode mode;

    torch::inductor::AOTIModelContainerRunnerCuda runner(model_so_path_string);
    std::vector<torch::Tensor> inputs = {torch::randn({8, 10}, at::kCUDA)};
    std::vector<torch::Tensor> outputs = runner.run(inputs);
    std::cout << "Result from the first inference:"<< std::endl;
    std::cout << outputs[0] << std::endl;

    // The second inference uses a different batch size and it works because we
    // specified that dimension as dynamic when compiling model.so.
    std::cout << "Result from the second inference:"<< std::endl;
    std::vector<torch::Tensor> inputs2 = {torch::randn({2, 10}, at::kCUDA)};
    std::cout << runner.run(inputs2)[0] << std::endl;

    return 0;
}
