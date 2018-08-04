/* This file was generated by KreMLin <https://github.com/FStarLang/kremlin>
 * KreMLin invocation: Kremlin.native -tmpdir ./ext -drop FStar,Prims,C,C.*,C.Loops.Spec.Loops,Spec.*,Lib.*,WasmSupport -drop Hacl.Cast,Hacl.UInt8,Hacl.UInt16,Hacl.UInt32,Hacl.UInt64,Hacl.UInt128 -drop Hacl.Spec.Endianness,Hacl.Endianness,Seq.Create -drop Hacl.Impl.SHA2_256.Lemmas,Hacl.Impl.SHA2_384.Lemmas,Hacl.Impl.SHA2_512.Lemmas -drop MerkleTree.High -I ../ ../MerkleTree.Low.fst lib/connect.c lib/Hacl_SHA2_256.c merkle_tree.c
 * F* version: 93d4859a
 * KreMLin version: b561bc14
 */

#include "kremlib.h"
#ifndef __MerkleTree_Low_H
#define __MerkleTree_Low_H

#include "LowStar.h"


typedef uint32_t MerkleTree_Low_uint32_t;

typedef uint8_t MerkleTree_Low_uint8_t;

extern uint32_t MerkleTree_Low_uint32_hash_size;

typedef uint8_t *MerkleTree_Low_hash;

typedef struct LowStar_Vector_vector_str__uint8_t__s
{
  uint32_t sz;
  uint32_t cap;
  uint8_t **vs;
}
LowStar_Vector_vector_str__uint8_t_;

typedef LowStar_Vector_vector_str__uint8_t_ MerkleTree_Low_hash_vec;

extern void MerkleTree_Low_hash_from_hashes(uint8_t *x0, uint8_t *x1, uint8_t *x2);

uint32_t MerkleTree_Low_uint32_pow2(uint32_t sz);

bool MerkleTree_Low_uint32_is_pow2(uint32_t n1);

uint32_t MerkleTree_Low_uint32_pow2_floor_(uint32_t n1);

uint32_t MerkleTree_Low_uint32_pow2_floor(uint32_t n1);

uint32_t MerkleTree_Low_uint32_num_of_ones(uint32_t n1);

typedef struct MerkleTree_Low_merkle_tree_s
{
  LowStar_Vector_vector_str__uint8_t_ values;
  LowStar_Vector_vector_str__uint8_t_ iroots;
}
MerkleTree_Low_merkle_tree;

bool MerkleTree_Low_uu___is_MT(MerkleTree_Low_merkle_tree projectee);

LowStar_Vector_vector_str__uint8_t_
MerkleTree_Low___proj__MT__item__values(MerkleTree_Low_merkle_tree projectee);

LowStar_Vector_vector_str__uint8_t_
MerkleTree_Low___proj__MT__item__iroots(MerkleTree_Low_merkle_tree projectee);

typedef MerkleTree_Low_merkle_tree *MerkleTree_Low_mt_ptr;

MerkleTree_Low_merkle_tree *MerkleTree_Low_create_merkle_tree();

LowStar_Vector_vector_str__uint8_t_
MerkleTree_Low_insert_value(LowStar_Vector_vector_str__uint8_t_ vs, uint8_t *nv);

void
MerkleTree_Low_insert_iroots(
  LowStar_Vector_vector_str__uint8_t_ irs,
  uint32_t nvalues,
  uint8_t *nv
);

void MerkleTree_Low_insert(MerkleTree_Low_merkle_tree *mt, uint8_t *nv);

void
MerkleTree_Low_merkle_root_of_iroots(
  LowStar_Vector_vector_str__uint8_t_ irs,
  uint32_t iidx,
  uint8_t *acc
);

void MerkleTree_Low_get_root(MerkleTree_Low_merkle_tree *mt, uint8_t *rt);

void MerkleTree_Low_free_merkle_tree(MerkleTree_Low_merkle_tree *mt);

#define __MerkleTree_Low_H_DEFINED
#endif
