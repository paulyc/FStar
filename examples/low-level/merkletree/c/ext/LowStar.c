/* This file was generated by KreMLin <https://github.com/FStarLang/kremlin>
 * KreMLin invocation: Kremlin.native -tmpdir ./ext -drop FStar,Prims,C,C.*,C.Loops.Spec.Loops,Spec.*,Lib.*,WasmSupport -drop Hacl.Cast,Hacl.UInt8,Hacl.UInt16,Hacl.UInt32,Hacl.UInt64,Hacl.UInt128 -drop Hacl.Spec.Endianness,Hacl.Endianness,Seq.Create -drop Hacl.Impl.SHA2_256.Lemmas,Hacl.Impl.SHA2_384.Lemmas,Hacl.Impl.SHA2_512.Lemmas -drop MerkleTree.High -I ../ ../MerkleTree.Low.fst lib/connect.c lib/Hacl_SHA2_256.c merkle_tree.c
 * F* version: 93d4859a
 * KreMLin version: b561bc14
 */

#include "LowStar.h"

static uint32_t LowStar_Vector_max_uint32 = (uint32_t)4294967295U;

static uint32_t LowStar_Vector_resize_ratio = (uint32_t)2U;

uint32_t LowStar_Vector_new_capacity(uint32_t cap)
{
  if (cap >= LowStar_Vector_max_uint32 / LowStar_Vector_resize_ratio)
    return LowStar_Vector_max_uint32;
  else
    return cap * LowStar_Vector_resize_ratio;
}

void LowStar_BufVector_new_region_()
{
  void *r1 = (void *)(uint8_t)0U;
}

void *LowStar_BufVector_root = (void *)(uint8_t)0U;

