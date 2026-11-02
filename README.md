## How to configure

First, execute `git submodule update --init --recursive` to initialize and update the submodules.
After that, FPGA-Buildsys will be cloned into `FPGA-Buildsys` directory.

The script `FPGA-Buildsys/main.py` is the main entry point of the build system.
Use `python3 FPGA-Buildsys/main.py [options]` to run the build system.

We recommend to first run `python3 FPGA-Buildsys/main.py install .` to install the quick entry scripts into the current directory. After that, you can run `./buildsys [options]` or `./buildsys.bat [options]` to run the build system,
depending on your operating system.

The build system requires several prerequisites to function properly. Therefore, we recommend to run `./buildsys init-venv` to create a virtual environment and install the required dependencies. The quick entry scripts will automatically activate the virtual environment when running the build system.

For completions, you can run `./buildsys install completion` to install the completion scripts for your terminal.

You can run `./buildsys [toolchain]-[operations]` to run the operations for a specific toolchain. For example, `./buildsys vivado-simulation` will run the simulation operation for the Vivado toolchain. To avoid repeating the toolchain name, you can also run `./buildsys toolchain [toolchain]` to set the default toolchain. After that, you can run `./buildsys [operations]` to run the operations for the default toolchain. For example, if you set Vivado as the default toolchain, you can run `./buildsys simulation` to run the simulation operation for Vivado.

For vivado toolchain, you need to add the Vivado path to your environment variable `PATH` before running the build system. 
The path is usually `$(PATH-TO-VIVADO)\$(VIVADO-VERSION)\bin`. For example: `C:\Xilinx\Vivado\2018.3\bin`.