PROMPT: API Model Guided Symbolic Execution for Component-level Analysis
===========================================================================================

PROMPT is built on top of the KLEE Symbolic Virtual Machine to perform API model guided 
symbolic execution at the component level. PROMPT achieves a scalable and precise analysis by 
constraining the environment of the component under analysis through API models that are 
specified using the PROSE API Modeling Language.

PROMPT can be installed according to the instructions for KLEE's LLVM-3.8 build instructions 
(available in INSTALL.TXT).

If you use PROMPT, please use the following paper to cite it:

```
@article{YB2020,
 title={Analyzing System Software Components using API Model Guided Symbolic Execution},
 author={Yavuz, Tuba and Bai, Ken (Yihang)},
 journal={Journal of Automated Software Engineering},
 year={2020},
 publisher={Springer}
}

```
