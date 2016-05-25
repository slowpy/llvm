; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -fast-isel -mtriple=i386-unknown-unknown -mattr=+avx2 | FileCheck %s --check-prefix=ALL --check-prefix=X32
; RUN: llc < %s -fast-isel -mtriple=x86_64-unknown-unknown -mattr=+avx2 | FileCheck %s --check-prefix=ALL --check-prefix=X64

; NOTE: This should use IR equivalent to what is generated by clang/test/CodeGen/avx2-builtins.c

define <4 x i64> @test_mm256_abs_epi8(<4 x i64> %a0) {
; X32-LABEL: test_mm256_abs_epi8:
; X32:       # BB#0:
; X32-NEXT:    vpabsb %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_abs_epi8:
; X64:       # BB#0:
; X64-NEXT:    vpabsb %ymm0, %ymm0
; X64-NEXT:    retq
  %arg = bitcast <4 x i64> %a0 to <32 x i8>
  %call = call <32 x i8> @llvm.x86.avx2.pabs.b(<32 x i8> %arg)
  %res = bitcast <32 x i8> %call to <4 x i64>
  ret <4 x i64> %res
}
declare <32 x i8> @llvm.x86.avx2.pabs.b(<32 x i8>) nounwind readnone

define <4 x i64> @test_mm256_abs_epi16(<4 x i64> %a0) {
; X32-LABEL: test_mm256_abs_epi16:
; X32:       # BB#0:
; X32-NEXT:    vpabsw %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_abs_epi16:
; X64:       # BB#0:
; X64-NEXT:    vpabsw %ymm0, %ymm0
; X64-NEXT:    retq
  %arg = bitcast <4 x i64> %a0 to <16 x i16>
  %call = call <16 x i16> @llvm.x86.avx2.pabs.w(<16 x i16> %arg)
  %res = bitcast <16 x i16> %call to <4 x i64>
  ret <4 x i64> %res
}
declare <16 x i16> @llvm.x86.avx2.pabs.w(<16 x i16>) nounwind readnone

define <4 x i64> @test_mm256_abs_epi32(<4 x i64> %a0) {
; X32-LABEL: test_mm256_abs_epi32:
; X32:       # BB#0:
; X32-NEXT:    vpabsd %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_abs_epi32:
; X64:       # BB#0:
; X64-NEXT:    vpabsd %ymm0, %ymm0
; X64-NEXT:    retq
  %arg = bitcast <4 x i64> %a0 to <8 x i32>
  %call = call <8 x i32> @llvm.x86.avx2.pabs.d(<8 x i32> %arg)
  %res = bitcast <8 x i32> %call to <4 x i64>
  ret <4 x i64> %res
}
declare <8 x i32> @llvm.x86.avx2.pabs.d(<8 x i32>) nounwind readnone

define <4 x i64> @test_mm256_add_epi8(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_add_epi8:
; X32:       # BB#0:
; X32-NEXT:    vpaddb %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_add_epi8:
; X64:       # BB#0:
; X64-NEXT:    vpaddb %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <32 x i8>
  %arg1 = bitcast <4 x i64> %a1 to <32 x i8>
  %res = add <32 x i8> %arg0, %arg1
  %bc = bitcast <32 x i8> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_add_epi16(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_add_epi16:
; X32:       # BB#0:
; X32-NEXT:    vpaddw %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_add_epi16:
; X64:       # BB#0:
; X64-NEXT:    vpaddw %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <16 x i16>
  %arg1 = bitcast <4 x i64> %a1 to <16 x i16>
  %res = add <16 x i16> %arg0, %arg1
  %bc = bitcast <16 x i16> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_add_epi32(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_add_epi32:
; X32:       # BB#0:
; X32-NEXT:    vpaddd %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_add_epi32:
; X64:       # BB#0:
; X64-NEXT:    vpaddd %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <8 x i32>
  %arg1 = bitcast <4 x i64> %a1 to <8 x i32>
  %res = add <8 x i32> %arg0, %arg1
  %bc = bitcast <8 x i32> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_add_epi64(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_add_epi64:
; X32:       # BB#0:
; X32-NEXT:    vpaddq %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_add_epi64:
; X64:       # BB#0:
; X64-NEXT:    vpaddq %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %res = add <4 x i64> %a0, %a1
  ret <4 x i64> %res
}

; TODO test_mm256_adds_epi16 (__m256i a, __m256i b)
; TODO test_mm256_adds_epi8 (__m256i a, __m256i b)
; TODO test_mm256_adds_epu16 (__m256i a, __m256i b)
; TODO test_mm256_adds_epu8 (__m256i a, __m256i b)
; TODO test_mm256_alignr_epi8 (__m256i a, __m256i b, const int count)

define <4 x i64> @test_mm256_and_si256(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_and_si256:
; X32:       # BB#0:
; X32-NEXT:    vandps %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_and_si256:
; X64:       # BB#0:
; X64-NEXT:    vandps %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %res = and <4 x i64> %a0, %a1
  ret <4 x i64> %res
}

define <4 x i64> @test_mm256_andnot_si256(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_andnot_si256:
; X32:       # BB#0:
; X32-NEXT:    vpcmpeqd %ymm2, %ymm2, %ymm2
; X32-NEXT:    vpxor %ymm2, %ymm0, %ymm0
; X32-NEXT:    vpand %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_andnot_si256:
; X64:       # BB#0:
; X64-NEXT:    vpcmpeqd %ymm2, %ymm2, %ymm2
; X64-NEXT:    vpxor %ymm2, %ymm0, %ymm0
; X64-NEXT:    vpand %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %not = xor <4 x i64> %a0, <i64 -1, i64 -1, i64 -1, i64 -1>
  %res = and <4 x i64> %not, %a1
  ret <4 x i64> %res
}

; TODO test_mm256_avg_epu16 (__m256i a, __m256i b)
; TODO test_mm256_avg_epu8 (__m256i a, __m256i b)
; TODO test_mm256_blend_epi16 (__m256i a, __m256i b, const int imm8)
; TODO test_mm_blend_epi32 (__m128i a, __m128i b, const int imm8)
; TODO test_mm256_blend_epi32 (__m256i a, __m256i b, const int imm8)
; TODO test_mm256_blendv_epi8 (__m256i a, __m256i b, __m256i mask)
; TODO test_mm_broadcastb_epi8 (__m128i a)
; TODO test_mm256_broadcastb_epi8 (__m128i a)
; TODO test_mm_broadcastd_epi32 (__m128i a)
; TODO test_mm256_broadcastd_epi32 (__m128i a)
; TODO test_mm_broadcastq_epi64 (__m128i a)
; TODO test_mm256_broadcastq_epi64 (__m128i a)
; TODO test_mm_broadcastsd_pd (__m128d a)
; TODO test_mm256_broadcastsd_pd (__m128d a)
; TODO test_mm256_broadcastsi128_si256 (__m128i a)
; TODO test_mm_broadcastss_ps (__m128 a)
; TODO test_mm256_broadcastss_ps (__m128 a)
; TODO test_mm_broadcastw_epi16 (__m128i a)
; TODO test_mm256_broadcastw_epi16 (__m128i a)
; TODO test_mm256_bslli_epi128 (__m256i a, const int imm8)
; TODO test_mm256_bsrli_epi128 (__m256i a, const int imm8)

define <4 x i64> @test_mm256_cmpeq_epi8(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_cmpeq_epi8:
; X32:       # BB#0:
; X32-NEXT:    vpcmpeqb %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_cmpeq_epi8:
; X64:       # BB#0:
; X64-NEXT:    vpcmpeqb %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <32 x i8>
  %arg1 = bitcast <4 x i64> %a1 to <32 x i8>
  %cmp = icmp eq <32 x i8> %arg0, %arg1
  %res = sext <32 x i1> %cmp to <32 x i8>
  %bc = bitcast <32 x i8> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_cmpeq_epi16(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_cmpeq_epi16:
; X32:       # BB#0:
; X32-NEXT:    vpcmpeqw %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_cmpeq_epi16:
; X64:       # BB#0:
; X64-NEXT:    vpcmpeqw %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <16 x i16>
  %arg1 = bitcast <4 x i64> %a1 to <16 x i16>
  %cmp = icmp eq <16 x i16> %arg0, %arg1
  %res = sext <16 x i1> %cmp to <16 x i16>
  %bc = bitcast <16 x i16> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_cmpeq_epi32(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_cmpeq_epi32:
; X32:       # BB#0:
; X32-NEXT:    vpcmpeqd %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_cmpeq_epi32:
; X64:       # BB#0:
; X64-NEXT:    vpcmpeqd %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <8 x i32>
  %arg1 = bitcast <4 x i64> %a1 to <8 x i32>
  %cmp = icmp eq <8 x i32> %arg0, %arg1
  %res = sext <8 x i1> %cmp to <8 x i32>
  %bc = bitcast <8 x i32> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_cmpeq_epi64(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_cmpeq_epi64:
; X32:       # BB#0:
; X32-NEXT:    vpcmpeqq %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_cmpeq_epi64:
; X64:       # BB#0:
; X64-NEXT:    vpcmpeqq %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %cmp = icmp eq <4 x i64> %a0, %a1
  %res = sext <4 x i1> %cmp to <4 x i64>
  ret <4 x i64> %res
}

define <4 x i64> @test_mm256_cmpgt_epi8(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_cmpgt_epi8:
; X32:       # BB#0:
; X32-NEXT:    vpcmpgtb %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_cmpgt_epi8:
; X64:       # BB#0:
; X64-NEXT:    vpcmpgtb %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <32 x i8>
  %arg1 = bitcast <4 x i64> %a1 to <32 x i8>
  %cmp = icmp sgt <32 x i8> %arg0, %arg1
  %res = sext <32 x i1> %cmp to <32 x i8>
  %bc = bitcast <32 x i8> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_cmpgt_epi16(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_cmpgt_epi16:
; X32:       # BB#0:
; X32-NEXT:    vpcmpgtw %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_cmpgt_epi16:
; X64:       # BB#0:
; X64-NEXT:    vpcmpgtw %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <16 x i16>
  %arg1 = bitcast <4 x i64> %a1 to <16 x i16>
  %cmp = icmp sgt <16 x i16> %arg0, %arg1
  %res = sext <16 x i1> %cmp to <16 x i16>
  %bc = bitcast <16 x i16> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_cmpgt_epi32(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_cmpgt_epi32:
; X32:       # BB#0:
; X32-NEXT:    vpcmpgtd %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_cmpgt_epi32:
; X64:       # BB#0:
; X64-NEXT:    vpcmpgtd %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <8 x i32>
  %arg1 = bitcast <4 x i64> %a1 to <8 x i32>
  %cmp = icmp sgt <8 x i32> %arg0, %arg1
  %res = sext <8 x i1> %cmp to <8 x i32>
  %bc = bitcast <8 x i32> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_cmpgt_epi64(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_cmpgt_epi64:
; X32:       # BB#0:
; X32-NEXT:    vpcmpgtq %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_cmpgt_epi64:
; X64:       # BB#0:
; X64-NEXT:    vpcmpgtq %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %cmp = icmp sgt <4 x i64> %a0, %a1
  %res = sext <4 x i1> %cmp to <4 x i64>
  ret <4 x i64> %res
}

; TODO test_mm256_cvtepi16_epi32 (__m128i a)
; TODO test_mm256_cvtepi16_epi64 (__m128i a)
; TODO test_mm256_cvtepi32_epi64 (__m128i a)
; TODO test_mm256_cvtepi8_epi16 (__m128i a)
; TODO test_mm256_cvtepi8_epi32 (__m128i a)
; TODO test_mm256_cvtepi8_epi64 (__m128i a)
; TODO test_mm256_cvtepu16_epi32 (__m128i a)
; TODO test_mm256_cvtepu16_epi64 (__m128i a)
; TODO test_mm256_cvtepu32_epi64 (__m128i a)
; TODO test_mm256_cvtepu8_epi16 (__m128i a)
; TODO test_mm256_cvtepu8_epi32 (__m128i a)
; TODO test_mm256_cvtepu8_epi64 (__m128i a)
; TODO test_mm256_extracti128_si256 (__m256i a, const int imm8)
; TODO test_mm256_hadd_epi16 (__m256i a, __m256i b)
; TODO test_mm256_hadd_epi32 (__m256i a, __m256i b)
; TODO test_mm256_hadds_epi16 (__m256i a, __m256i b)
; TODO test_mm256_hsub_epi16 (__m256i a, __m256i b)
; TODO test_mm256_hsub_epi32 (__m256i a, __m256i b)
; TODO test_mm256_hsubs_epi16 (__m256i a, __m256i b)
; TODO test_mm_i32gather_epi32 (int const* base_addr, __m128i vindex, const int scale)
; TODO test_mm_mask_i32gather_epi32 (__m128i src, int const* base_addr, __m128i vindex, __m128i mask, const int scale)
; TODO test_mm256_i32gather_epi32 (int const* base_addr, __m256i vindex, const int scale)
; TODO test_mm256_mask_i32gather_epi32 (__m256i src, int const* base_addr, __m256i vindex, __m256i mask, const int scale)
; TODO test_mm_i32gather_epi64 (__int64 const* base_addr, __m128i vindex, const int scale)
; TODO test_mm_mask_i32gather_epi64 (__m128i src, __int64 const* base_addr, __m128i vindex, __m128i mask, const int scale)
; TODO test_mm256_i32gather_epi64 (__int64 const* base_addr, __m128i vindex, const int scale)
; TODO test_mm256_mask_i32gather_epi64 (__m256i src, __int64 const* base_addr, __m128i vindex, __m256i mask, const int scale)
; TODO test_mm_i32gather_pd (double const* base_addr, __m128i vindex, const int scale)
; TODO test_mm_mask_i32gather_pd (__m128d src, double const* base_addr, __m128i vindex, __m128d mask, const int scale)
; TODO test_mm256_i32gather_pd (double const* base_addr, __m128i vindex, const int scale)
; TODO test_mm256_mask_i32gather_pd (__m256d src, double const* base_addr, __m128i vindex, __m256d mask, const int scale)
; TODO test_mm_i32gather_ps (float const* base_addr, __m128i vindex, const int scale)
; TODO test_mm_mask_i32gather_ps (__m128 src, float const* base_addr, __m128i vindex, __m128 mask, const int scale)
; TODO test_mm256_i32gather_ps (float const* base_addr, __m256i vindex, const int scale)
; TODO test_mm256_mask_i32gather_ps (__m256 src, float const* base_addr, __m256i vindex, __m256 mask, const int scale)
; TODO test_mm_i64gather_epi32 (int const* base_addr, __m128i vindex, const int scale)
; TODO test_mm_mask_i64gather_epi32 (__m128i src, int const* base_addr, __m128i vindex, __m128i mask, const int scale)
; TODO test_mm256_i64gather_epi32 (int const* base_addr, __m256i vindex, const int scale)
; TODO test_mm256_mask_i64gather_epi32 (__m128i src, int const* base_addr, __m256i vindex, __m128i mask, const int scale)
; TODO test_mm_i64gather_epi64 (__int64 const* base_addr, __m128i vindex, const int scale)
; TODO test_mm_mask_i64gather_epi64 (__m128i src, __int64 const* base_addr, __m128i vindex, __m128i mask, const int scale)
; TODO test_mm256_i64gather_epi64 (__int64 const* base_addr, __m256i vindex, const int scale)
; TODO test_mm256_mask_i64gather_epi64 (__m256i src, __int64 const* base_addr, __m256i vindex, __m256i mask, const int scale)
; TODO test_mm_i64gather_pd (double const* base_addr, __m128i vindex, const int scale)
; TODO test_mm_mask_i64gather_pd (__m128d src, double const* base_addr, __m128i vindex, __m128d mask, const int scale)
; TODO test_mm256_i64gather_pd (double const* base_addr, __m256i vindex, const int scale)
; TODO test_mm256_mask_i64gather_pd (__m256d src, double const* base_addr, __m256i vindex, __m256d mask, const int scale)
; TODO test_mm_i64gather_ps (float const* base_addr, __m128i vindex, const int scale)
; TODO test_mm_mask_i64gather_ps (__m128 src, float const* base_addr, __m128i vindex, __m128 mask, const int scale)
; TODO test_mm256_i64gather_ps (float const* base_addr, __m256i vindex, const int scale)
; TODO test_mm256_mask_i64gather_ps (__m128 src, float const* base_addr, __m256i vindex, __m128 mask, const int scale)
; TODO test_mm256_inserti128_si256 (__m256i a, __m128i b, const int imm8)
; TODO test_mm256_madd_epi16 (__m256i a, __m256i b)
; TODO test_mm256_maddubs_epi16 (__m256i a, __m256i b)
; TODO test_mm_maskload_epi32 (int const* mem_addr, __m128i mask)
; TODO test_mm256_maskload_epi32 (int const* mem_addr, __m256i mask)
; TODO test_mm_maskload_epi64 (__int64 const* mem_addr, __m128i mask)
; TODO test_mm256_maskload_epi64 (__int64 const* mem_addr, __m256i mask)
; TODO test_mm_maskstore_epi32 (int* mem_addr, __m128i mask, __m128i a)
; TODO test_mm256_maskstore_epi32 (int* mem_addr, __m256i mask, __m256i a)
; TODO test_mm_maskstore_epi64 (__int64* mem_addr, __m128i mask, __m128i a)
; TODO test_mm256_maskstore_epi64 (__int64* mem_addr, __m256i mask, __m256i a)
; TODO test_mm256_max_epi16 (__m256i a, __m256i b)
; TODO test_mm256_max_epi32 (__m256i a, __m256i b)
; TODO test_mm256_max_epi8 (__m256i a, __m256i b)
; TODO test_mm256_max_epu16 (__m256i a, __m256i b)
; TODO test_mm256_max_epu32 (__m256i a, __m256i b)
; TODO test_mm256_max_epu8 (__m256i a, __m256i b)
; TODO test_mm256_min_epi16 (__m256i a, __m256i b)
; TODO test_mm256_min_epi32 (__m256i a, __m256i b)
; TODO test_mm256_min_epi8 (__m256i a, __m256i b)
; TODO test_mm256_min_epu16 (__m256i a, __m256i b)
; TODO test_mm256_min_epu32 (__m256i a, __m256i b)
; TODO test_mm256_min_epu8 (__m256i a, __m256i b)
; TODO test_mm256_movemask_epi8 (__m256i a)
; TODO test_mm256_mpsadbw_epu8 (__m256i a, __m256i b, const int imm8)
; TODO test_mm256_mul_epi32 (__m256i a, __m256i b)
; TODO test_mm256_mul_epu32 (__m256i a, __m256i b)
; TODO test_mm256_mulhi_epi16 (__m256i a, __m256i b)
; TODO test_mm256_mulhi_epu16 (__m256i a, __m256i b)
; TODO test_mm256_mulhrs_epi16 (__m256i a, __m256i b)
; TODO test_mm256_mullo_epi16 (__m256i a, __m256i b)
; TODO test_mm256_mullo_epi32 (__m256i a, __m256i b)

define <4 x i64> @test_mm256_or_si256(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_or_si256:
; X32:       # BB#0:
; X32-NEXT:    vorps %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_or_si256:
; X64:       # BB#0:
; X64-NEXT:    vorps %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %res = or <4 x i64> %a0, %a1
  ret <4 x i64> %res
}

; TODO test_mm256_packs_epi16 (__m256i a, __m256i b)
; TODO test_mm256_packs_epi32 (__m256i a, __m256i b)
; TODO test_mm256_packus_epi16 (__m256i a, __m256i b)
; TODO test_mm256_packus_epi32 (__m256i a, __m256i b)
; TODO test_mm256_permute2x128_si256 (__m256i a, __m256i b, const int imm8)
; TODO test_mm256_permute4x64_epi64 (__m256i a, const int imm8)
; TODO test_mm256_permute4x64_pd (__m256d a, const int imm8)
; TODO test_mm256_permutevar8x32_epi32 (__m256i a, __m256i idx)
; TODO test_mm256_permutevar8x32_ps (__m256 a, __m256i idx)
; TODO test_mm256_sad_epu8 (__m256i a, __m256i b)
; TODO test_mm256_shuffle_epi32 (__m256i a, const int imm8)
; TODO test_mm256_shuffle_epi8 (__m256i a, __m256i b)
; TODO test_mm256_shufflehi_epi16 (__m256i a, const int imm8)
; TODO test_mm256_shufflelo_epi16 (__m256i a, const int imm8)
; TODO test_mm256_sign_epi16 (__m256i a, __m256i b)
; TODO test_mm256_sign_epi32 (__m256i a, __m256i b)
; TODO test_mm256_sign_epi8 (__m256i a, __m256i b)
; TODO test_mm256_sll_epi16 (__m256i a, __m128i count)
; TODO test_mm256_sll_epi32 (__m256i a, __m128i count)
; TODO test_mm256_sll_epi64 (__m256i a, __m128i count)
; TODO test_mm256_slli_epi16 (__m256i a, int imm8)
; TODO test_mm256_slli_epi32 (__m256i a, int imm8)
; TODO test_mm256_slli_epi64 (__m256i a, int imm8)
; TODO test_mm256_slli_si256 (__m256i a, const int imm8)
; TODO test_mm_sllv_epi32 (__m128i a, __m128i count)
; TODO test_mm256_sllv_epi32 (__m256i a, __m256i count)
; TODO test_mm_sllv_epi64 (__m128i a, __m128i count)
; TODO test_mm256_sllv_epi64 (__m256i a, __m256i count)
; TODO test_mm256_sra_epi16 (__m256i a, __m128i count)
; TODO test_mm256_sra_epi32 (__m256i a, __m128i count)
; TODO test_mm256_srai_epi16 (__m256i a, int imm8)
; TODO test_mm256_srai_epi32 (__m256i a, int imm8)
; TODO test_mm_srav_epi32 (__m128i a, __m128i count)
; TODO test_mm256_srav_epi32 (__m256i a, __m256i count)
; TODO test_mm256_srl_epi16 (__m256i a, __m128i count)
; TODO test_mm256_srl_epi32 (__m256i a, __m128i count)
; TODO test_mm256_srl_epi64 (__m256i a, __m128i count)
; TODO test_mm256_srli_epi16 (__m256i a, int imm8)
; TODO test_mm256_srli_epi32 (__m256i a, int imm8)
; TODO test_mm256_srli_epi64 (__m256i a, int imm8)
; TODO test_mm256_srli_si256 (__m256i a, const int imm8)
; TODO test_mm_srlv_epi32 (__m128i a, __m128i count)
; TODO test_mm256_srlv_epi32 (__m256i a, __m256i count)
; TODO test_mm_srlv_epi64 (__m128i a, __m128i count)
; TODO test_mm256_srlv_epi64 (__m256i a, __m256i count)
; TODO test_mm256_stream_load_si256 (__m256i const* mem_addr)

define <4 x i64> @test_mm256_sub_epi8(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_sub_epi8:
; X32:       # BB#0:
; X32-NEXT:    vpsubb %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_sub_epi8:
; X64:       # BB#0:
; X64-NEXT:    vpsubb %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <32 x i8>
  %arg1 = bitcast <4 x i64> %a1 to <32 x i8>
  %res = sub <32 x i8> %arg0, %arg1
  %bc = bitcast <32 x i8> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_sub_epi16(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_sub_epi16:
; X32:       # BB#0:
; X32-NEXT:    vpsubw %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_sub_epi16:
; X64:       # BB#0:
; X64-NEXT:    vpsubw %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <16 x i16>
  %arg1 = bitcast <4 x i64> %a1 to <16 x i16>
  %res = sub <16 x i16> %arg0, %arg1
  %bc = bitcast <16 x i16> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_sub_epi32(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_sub_epi32:
; X32:       # BB#0:
; X32-NEXT:    vpsubd %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_sub_epi32:
; X64:       # BB#0:
; X64-NEXT:    vpsubd %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %arg0 = bitcast <4 x i64> %a0 to <8 x i32>
  %arg1 = bitcast <4 x i64> %a1 to <8 x i32>
  %res = sub <8 x i32> %arg0, %arg1
  %bc = bitcast <8 x i32> %res to <4 x i64>
  ret <4 x i64> %bc
}

define <4 x i64> @test_mm256_sub_epi64(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_sub_epi64:
; X32:       # BB#0:
; X32-NEXT:    vpsubq %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_sub_epi64:
; X64:       # BB#0:
; X64-NEXT:    vpsubq %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %res = sub <4 x i64> %a0, %a1
  ret <4 x i64> %res
}

; TODO test_mm256_subs_epi16 (__m256i a, __m256i b)
; TODO test_mm256_subs_epi8 (__m256i a, __m256i b)
; TODO test_mm256_subs_epu16 (__m256i a, __m256i b)
; TODO test_mm256_subs_epu8 (__m256i a, __m256i b)
; TODO test_mm256_unpackhi_epi16 (__m256i a, __m256i b)
; TODO test_mm256_unpackhi_epi32 (__m256i a, __m256i b)
; TODO test_mm256_unpackhi_epi64 (__m256i a, __m256i b)
; TODO test_mm256_unpackhi_epi8 (__m256i a, __m256i b)
; TODO test_mm256_unpacklo_epi16 (__m256i a, __m256i b)
; TODO test_mm256_unpacklo_epi32 (__m256i a, __m256i b)
; TODO test_mm256_unpacklo_epi64 (__m256i a, __m256i b)
; TODO test_mm256_unpacklo_epi8 (__m256i a, __m256i b)

define <4 x i64> @test_mm256_xor_si256(<4 x i64> %a0, <4 x i64> %a1) nounwind {
; X32-LABEL: test_mm256_xor_si256:
; X32:       # BB#0:
; X32-NEXT:    vxorps %ymm1, %ymm0, %ymm0
; X32-NEXT:    retl
;
; X64-LABEL: test_mm256_xor_si256:
; X64:       # BB#0:
; X64-NEXT:    vxorps %ymm1, %ymm0, %ymm0
; X64-NEXT:    retq
  %res = xor <4 x i64> %a0, %a1
  ret <4 x i64> %res
}