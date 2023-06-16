#ifndef DALVIK_MJOLNIRDIALECT_TD
#define DALVIK_MJOLNIRDIALECT_TD

include "mlir/IR/OpBase.td"

def Dalvik_Dialect : Dialect
{
    let name = "Dalvik";
    let summary = "Dialect for the instructions of Dalvik Virtual Machine";
    let description = [{
      This dialect tries to represent the instructions from the Dalvik Virtual Machine
      together with the instruction we will find also the different types found on
      this bytecode (Fields, Methods, Classes).
    }];

    let cppNamespace = "mlir::dalvik";
    let useDefaultTypePrinterParser = 1;
}


#endif
