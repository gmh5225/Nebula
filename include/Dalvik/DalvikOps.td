#ifndef DALVIK_OPS_ID
#define DALVIK_OPS_ID

include "DalvikDialect.td"

class DalvikOp<string mnemonic, list<Trait> traits = []> : Op<DalvikDialect,mnemonic,traits>;

#endif
