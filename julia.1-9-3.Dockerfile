# file to make base neovim images
# :PackerInstall not automated(not included)
FROM dev:base

RUN sudo apt update

RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.3-linux-x86_64.tar.gz
RUN tar -zxvf julia-1.9.3-linux-x86_64.tar.gz

RUN sudo mv julia-1.9.3/ /opt/

RUN sudo ln -s /opt/julia-1.9.3/bin/julia /usr/local/bin/julia

RUN apt install python3-pip -y

RUN pip3 install jupyter notebook

RUN julia -e 'using Pkg; Pkg.add(["IJulia", "DataFrames", "Distributions", "BenchmarkTools"])'
RUN julia -e 'using IJulia; IJulia.installkernel("Julia 1.9.3 12 Threads",env=Dict("JULIA_NUM_THREADS"=>"12",))'
