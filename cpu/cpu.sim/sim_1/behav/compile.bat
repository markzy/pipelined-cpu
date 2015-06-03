@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;C:/Programs/Xilinx/Vivado/2014.2/ids_lite/ISE/bin/nt64;C:/Programs/Xilinx/Vivado/2014.2/ids_lite/ISE/lib/nt64;C:/Programs/Xilinx/Vivado/2014.2/bin;%PATH%
set XILINX_PLANAHEAD=C:/Programs/Xilinx/Vivado/2014.2

xelab -m64 --debug typical --relax -L xil_defaultlib -L secureip --snapshot cpu_test_behav --prj G:/cpu/cpu.sim/sim_1/behav/cpu_test.prj   xil_defaultlib.cpu_test
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
