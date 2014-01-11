{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <mpdecimal.h>
module Bindings.Mpdecimal where
import Foreign.Ptr
#strict_import

#ccall mpd_version , IO CString
{- typedef uint64_t mpd_uint_t; -}
#synonym_t mpd_uint_t , CULong
{- typedef size_t mpd_size_t; -}
#synonym_t mpd_size_t , CSize
{- typedef int64_t mpd_ssize_t; -}
#synonym_t mpd_ssize_t , CInt
{- enum {
    MPD_ROUND_UP,
    MPD_ROUND_DOWN,
    MPD_ROUND_CEILING,
    MPD_ROUND_FLOOR,
    MPD_ROUND_HALF_UP,
    MPD_ROUND_HALF_DOWN,
    MPD_ROUND_HALF_EVEN,
    MPD_ROUND_05UP,
    MPD_ROUND_TRUNC,
    MPD_ROUND_GUARD
}; -}
#num MPD_ROUND_UP
#num MPD_ROUND_DOWN
#num MPD_ROUND_CEILING
#num MPD_ROUND_FLOOR
#num MPD_ROUND_HALF_UP
#num MPD_ROUND_HALF_DOWN
#num MPD_ROUND_HALF_EVEN
#num MPD_ROUND_05UP
#num MPD_ROUND_TRUNC
#num MPD_ROUND_GUARD
{- enum {
    MPD_CLAMP_DEFAULT, MPD_CLAMP_IEEE_754, MPD_CLAMP_GUARD
}; -}
#num MPD_CLAMP_DEFAULT
#num MPD_CLAMP_IEEE_754
#num MPD_CLAMP_GUARD
#globalvar mpd_round_string , CChar
#globalvar mpd_clamp_string , CChar
{- typedef struct mpd_context_t {
            mpd_ssize_t prec;
            mpd_ssize_t emax;
            mpd_ssize_t emin;
            uint32_t traps;
            uint32_t status;
            uint32_t newtrap;
            int round;
            int clamp;
            int allcr;
        } mpd_context_t; -}
#starttype mpd_context_t
#field prec , CInt
#field emax , CInt
#field emin , CInt
#field traps , CUInt
#field status , CUInt
#field newtrap , CUInt
#field round , CInt
#field clamp , CInt
#field allcr , CInt
#stoptype
#globalvar MPD_MINALLOC , CInt
#callback mpd_traphandler , Ptr <mpd_context_t> -> IO ()
#ccall mpd_dflt_traphandler , Ptr <mpd_context_t> -> IO ()
#ccall mpd_setminalloc , CInt -> IO ()
#ccall mpd_init , Ptr <mpd_context_t> -> CInt -> IO ()
#ccall mpd_maxcontext , Ptr <mpd_context_t> -> IO ()
#ccall mpd_defaultcontext , Ptr <mpd_context_t> -> IO ()
#ccall mpd_basiccontext , Ptr <mpd_context_t> -> IO ()
#ccall mpd_ieee_context , Ptr <mpd_context_t> -> CInt -> IO CInt
#ccall mpd_getprec , Ptr <mpd_context_t> -> IO CInt
#ccall mpd_getemax , Ptr <mpd_context_t> -> IO CInt
#ccall mpd_getemin , Ptr <mpd_context_t> -> IO CInt
#ccall mpd_getround , Ptr <mpd_context_t> -> IO CInt
#ccall mpd_gettraps , Ptr <mpd_context_t> -> IO CUInt
#ccall mpd_getstatus , Ptr <mpd_context_t> -> IO CUInt
#ccall mpd_getclamp , Ptr <mpd_context_t> -> IO CInt
#ccall mpd_getcr , Ptr <mpd_context_t> -> IO CInt
#ccall mpd_qsetprec , Ptr <mpd_context_t> -> CInt -> IO CInt
#ccall mpd_qsetemax , Ptr <mpd_context_t> -> CInt -> IO CInt
#ccall mpd_qsetemin , Ptr <mpd_context_t> -> CInt -> IO CInt
#ccall mpd_qsetround , Ptr <mpd_context_t> -> CInt -> IO CInt
#ccall mpd_qsettraps , Ptr <mpd_context_t> -> CUInt -> IO CInt
#ccall mpd_qsetstatus , Ptr <mpd_context_t> -> CUInt -> IO CInt
#ccall mpd_qsetclamp , Ptr <mpd_context_t> -> CInt -> IO CInt
#ccall mpd_qsetcr , Ptr <mpd_context_t> -> CInt -> IO CInt
#ccall mpd_addstatus_raise , Ptr <mpd_context_t> -> CUInt -> IO ()
{- typedef struct mpd_t {
            uint8_t flags;
            mpd_ssize_t exp;
            mpd_ssize_t digits;
            mpd_ssize_t len;
            mpd_ssize_t alloc;
            mpd_uint_t * data;
        } mpd_t; -}
#starttype mpd_t
#field flags , CUChar
#field exp , CInt
#field digits , CInt
#field len , CInt
#field alloc , CInt
#field data , Ptr CULong
#stoptype
{- typedef unsigned char uchar; -}
#synonym_t uchar , CUChar
{- typedef struct mpd_spec_t {
            mpd_ssize_t min_width;
            mpd_ssize_t prec;
            char type;
            char align;
            char sign;
            char fill[5];
            const char * dot;
            const char * sep;
            const char * grouping;
        } mpd_spec_t; -}
#starttype mpd_spec_t
#field min_width , CInt
#field prec , CInt
#field type , CChar
#field align , CChar
#field sign , CChar
#array_field fill , CChar
#field dot , CString
#field sep , CString
#field grouping , CString
#stoptype
#ccall mpd_to_sci , Ptr <mpd_t> -> CInt -> IO CString
#ccall mpd_to_eng , Ptr <mpd_t> -> CInt -> IO CString
#ccall mpd_to_sci_size , Ptr CString -> Ptr <mpd_t> -> CInt -> IO CInt
#ccall mpd_to_eng_size , Ptr CString -> Ptr <mpd_t> -> CInt -> IO CInt
#ccall mpd_validate_lconv , Ptr <mpd_spec_t> -> IO CInt
#ccall mpd_parse_fmt_str , Ptr <mpd_spec_t> -> CString -> CInt -> IO CInt
#ccall mpd_qformat_spec , Ptr <mpd_t> -> Ptr <mpd_spec_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO CString
#ccall mpd_qformat , Ptr <mpd_t> -> CString -> Ptr <mpd_context_t> -> Ptr CUInt -> IO CString
#ccall mpd_snprint_flags , CString -> CInt -> CUInt -> IO CInt
#ccall mpd_lsnprint_flags , CString -> CInt -> CUInt -> Ptr CString -> IO CInt
#ccall mpd_lsnprint_signals , CString -> CInt -> CUInt -> Ptr CString -> IO CInt
{- next line is removed - prints to a C file object -}
{- #ccall mpd_fprint , Ptr <_IO_FILE> -> Ptr <mpd_t> -> IO () -}
#ccall mpd_print , Ptr <mpd_t> -> IO ()
#ccall mpd_qset_string , Ptr <mpd_t> -> CString -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_seterror , Ptr <mpd_t> -> CUInt -> Ptr CUInt -> IO ()
#ccall mpd_setspecial , Ptr <mpd_t> -> CUChar -> CUChar -> IO ()
#ccall mpd_zerocoeff , Ptr <mpd_t> -> IO ()
#ccall mpd_qmaxcoeff , Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qset_ssize , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qset_i32 , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qset_uint , Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qset_u32 , Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qset_i64 , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qset_u64 , Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsset_ssize , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsset_i32 , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsset_uint , Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsset_u32 , Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qget_ssize , Ptr <mpd_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qget_uint , Ptr <mpd_t> -> Ptr CUInt -> IO CULong
#ccall mpd_qabs_uint , Ptr <mpd_t> -> Ptr CUInt -> IO CULong
#ccall mpd_qget_i32 , Ptr <mpd_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qget_u32 , Ptr <mpd_t> -> Ptr CUInt -> IO CUInt
#ccall mpd_qget_i64 , Ptr <mpd_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qget_u64 , Ptr <mpd_t> -> Ptr CUInt -> IO CULong
#ccall mpd_qcheck_nan , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qcheck_nans , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qfinalize , Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_class , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CString
#ccall mpd_qcopy , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qncopy , Ptr <mpd_t> -> IO (Ptr <mpd_t>)
#ccall mpd_qcopy_abs , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qcopy_negate , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qcopy_sign , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qand , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qinvert , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qlogb , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qor , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qscaleb , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qxor , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_same_quantum , Ptr <mpd_t> -> Ptr <mpd_t> -> IO CInt
#ccall mpd_qrotate , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qshiftl , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr CUInt -> IO CInt
#ccall mpd_qshiftr , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr CUInt -> IO CULong
#ccall mpd_qshiftr_inplace , Ptr <mpd_t> -> CInt -> IO CULong
#ccall mpd_qshift , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qshiftn , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qcmp , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qcompare , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO CInt
#ccall mpd_qcompare_signal , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO CInt
#ccall mpd_cmp_total , Ptr <mpd_t> -> Ptr <mpd_t> -> IO CInt
#ccall mpd_cmp_total_mag , Ptr <mpd_t> -> Ptr <mpd_t> -> IO CInt
#ccall mpd_compare_total , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> IO CInt
#ccall mpd_compare_total_mag , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> IO CInt
#ccall mpd_qround_to_intx , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qround_to_int , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qtrunc , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qfloor , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qceil , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qabs , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmax , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmax_mag , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmin , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmin_mag , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qminus , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qplus , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qnext_minus , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qnext_plus , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qnext_toward , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qquantize , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qrescale , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qrescale_fmt , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qreduce , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qadd , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qadd_ssize , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qadd_i32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qadd_uint , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qadd_u32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsub , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsub_ssize , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsub_i32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsub_uint , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsub_u32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmul , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmul_ssize , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmul_i32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmul_uint , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmul_u32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qfma , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdiv , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdiv_ssize , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdiv_i32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdiv_uint , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdiv_u32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdivint , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qrem , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qrem_near , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdivmod , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qpow , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qpowmod , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qexp , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qln10 , Ptr <mpd_t> -> CInt -> Ptr CUInt -> IO ()
#ccall mpd_qln , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qlog10 , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsqrt , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qinvroot , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qadd_i64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qadd_u64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsub_i64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsub_u64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmul_i64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qmul_u64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdiv_i64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qdiv_u64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_sizeinbase , Ptr <mpd_t> -> CUInt -> IO CSize
#ccall mpd_qimport_u16 , Ptr <mpd_t> -> Ptr CUShort -> CSize -> CUChar -> CUInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qimport_u32 , Ptr <mpd_t> -> Ptr CUInt -> CSize -> CUChar -> CUInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qexport_u16 , Ptr (Ptr CUShort) -> CSize -> CUInt -> Ptr <mpd_t> -> Ptr CUInt -> IO CSize
#ccall mpd_qexport_u32 , Ptr (Ptr CUInt) -> CSize -> CUInt -> Ptr <mpd_t> -> Ptr CUInt -> IO CSize
#ccall mpd_format , Ptr <mpd_t> -> CString -> Ptr <mpd_context_t> -> IO CString
#ccall mpd_import_u16 , Ptr <mpd_t> -> Ptr CUShort -> CSize -> CUChar -> CUInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_import_u32 , Ptr <mpd_t> -> Ptr CUInt -> CSize -> CUChar -> CUInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_export_u16 , Ptr (Ptr CUShort) -> CSize -> CUInt -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CSize
#ccall mpd_export_u32 , Ptr (Ptr CUInt) -> CSize -> CUInt -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CSize
#ccall mpd_finalize , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_check_nan , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_check_nans , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_set_string , Ptr <mpd_t> -> CString -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_maxcoeff , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sset_ssize , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sset_i32 , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sset_uint , Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sset_u32 , Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_set_ssize , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_set_i32 , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_set_uint , Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_set_u32 , Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_set_i64 , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_set_u64 , Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_get_ssize , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_get_uint , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CULong
#ccall mpd_abs_uint , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CULong
#ccall mpd_get_i32 , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_get_u32 , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CUInt
#ccall mpd_get_i64 , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_get_u64 , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CULong
#ccall mpd_and , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_copy , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_canonical , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_copy_abs , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_copy_negate , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_copy_sign , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_invert , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_logb , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_or , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_rotate , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_scaleb , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_shiftl , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_shiftr , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO CULong
#ccall mpd_shiftn , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_shift , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_xor , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_abs , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_cmp , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_compare , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_compare_signal , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_add , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_add_ssize , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_add_i32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_add_uint , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_add_u32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sub , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sub_ssize , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sub_i32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sub_uint , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sub_u32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_div , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_div_ssize , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_div_i32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_div_uint , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_div_u32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_divmod , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_divint , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_exp , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_fma , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_ln , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_log10 , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_max , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_max_mag , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_min , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_min_mag , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_minus , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_mul , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_mul_ssize , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_mul_i32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_mul_uint , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_mul_u32 , Ptr <mpd_t> -> Ptr <mpd_t> -> CUInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_next_minus , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_next_plus , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_next_toward , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_plus , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_pow , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_powmod , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_quantize , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_rescale , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_reduce , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_rem , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_rem_near , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_round_to_intx , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_round_to_int , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_trunc , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_floor , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_ceil , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sqrt , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_invroot , Ptr <mpd_t> -> Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_add_i64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_add_u64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sub_i64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sub_u64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_div_i64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_div_u64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_mul_i64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_mul_u64 , Ptr <mpd_t> -> Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_qsset_i64 , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_qsset_u64 , Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> Ptr CUInt -> IO ()
#ccall mpd_sset_i64 , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_sset_u64 , Ptr <mpd_t> -> CULong -> Ptr <mpd_context_t> -> IO ()
#ccall mpd_adjexp , Ptr <mpd_t> -> IO CInt
#ccall mpd_etiny , Ptr <mpd_context_t> -> IO CInt
#ccall mpd_etop , Ptr <mpd_context_t> -> IO CInt
#ccall mpd_msword , Ptr <mpd_t> -> IO CULong
#ccall mpd_word_digits , CULong -> IO CInt
#ccall mpd_msd , CULong -> IO CULong
#ccall mpd_lsd , CULong -> IO CULong
#ccall mpd_digits_to_size , CInt -> IO CInt
#ccall mpd_exp_digits , CInt -> IO CInt
#ccall mpd_iscanonical , Ptr <mpd_t> -> IO CInt
#ccall mpd_isfinite , Ptr <mpd_t> -> IO CInt
#ccall mpd_isinfinite , Ptr <mpd_t> -> IO CInt
#ccall mpd_isinteger , Ptr <mpd_t> -> IO CInt
#ccall mpd_isnan , Ptr <mpd_t> -> IO CInt
#ccall mpd_isnegative , Ptr <mpd_t> -> IO CInt
#ccall mpd_ispositive , Ptr <mpd_t> -> IO CInt
#ccall mpd_isqnan , Ptr <mpd_t> -> IO CInt
#ccall mpd_issigned , Ptr <mpd_t> -> IO CInt
#ccall mpd_issnan , Ptr <mpd_t> -> IO CInt
#ccall mpd_isspecial , Ptr <mpd_t> -> IO CInt
#ccall mpd_iszero , Ptr <mpd_t> -> IO CInt
#ccall mpd_iszerocoeff , Ptr <mpd_t> -> IO CInt
#ccall mpd_isnormal , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_issubnormal , Ptr <mpd_t> -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_isoddword , CULong -> IO CInt
#ccall mpd_isoddcoeff , Ptr <mpd_t> -> IO CInt
#ccall mpd_isodd , Ptr <mpd_t> -> IO CInt
#ccall mpd_iseven , Ptr <mpd_t> -> IO CInt
#ccall mpd_sign , Ptr <mpd_t> -> IO CUChar
#ccall mpd_arith_sign , Ptr <mpd_t> -> IO CInt
#ccall mpd_radix , IO CLong
#ccall mpd_isdynamic , Ptr <mpd_t> -> IO CInt
#ccall mpd_isstatic , Ptr <mpd_t> -> IO CInt
#ccall mpd_isdynamic_data , Ptr <mpd_t> -> IO CInt
#ccall mpd_isstatic_data , Ptr <mpd_t> -> IO CInt
#ccall mpd_isshared_data , Ptr <mpd_t> -> IO CInt
#ccall mpd_isconst_data , Ptr <mpd_t> -> IO CInt
#ccall mpd_trail_zeros , Ptr <mpd_t> -> IO CInt
#ccall mpd_setdigits , Ptr <mpd_t> -> IO ()
#ccall mpd_set_sign , Ptr <mpd_t> -> CUChar -> IO ()
#ccall mpd_signcpy , Ptr <mpd_t> -> Ptr <mpd_t> -> IO ()
#ccall mpd_set_infinity , Ptr <mpd_t> -> IO ()
#ccall mpd_set_qnan , Ptr <mpd_t> -> IO ()
#ccall mpd_set_snan , Ptr <mpd_t> -> IO ()
#ccall mpd_set_negative , Ptr <mpd_t> -> IO ()
#ccall mpd_set_positive , Ptr <mpd_t> -> IO ()
#ccall mpd_set_dynamic , Ptr <mpd_t> -> IO ()
#ccall mpd_set_static , Ptr <mpd_t> -> IO ()
#ccall mpd_set_dynamic_data , Ptr <mpd_t> -> IO ()
#ccall mpd_set_static_data , Ptr <mpd_t> -> IO ()
#ccall mpd_set_shared_data , Ptr <mpd_t> -> IO ()
#ccall mpd_set_const_data , Ptr <mpd_t> -> IO ()
#ccall mpd_clear_flags , Ptr <mpd_t> -> IO ()
#ccall mpd_set_flags , Ptr <mpd_t> -> CUChar -> IO ()
#ccall mpd_copy_flags , Ptr <mpd_t> -> Ptr <mpd_t> -> IO ()
#callback mpd_mallocfunc , CSize -> IO (Ptr ())
#callback mpd_callocfunc , CSize -> CSize -> IO (Ptr ())
#callback mpd_reallocfunc , Ptr () -> CSize -> IO (Ptr ())
#callback mpd_free , Ptr () -> IO ()
#ccall mpd_callocfunc_em , CSize -> CSize -> IO (Ptr ())
#ccall mpd_alloc , CSize -> CSize -> IO (Ptr ())
#ccall mpd_calloc , CSize -> CSize -> IO (Ptr ())
#ccall mpd_realloc , Ptr () -> CSize -> CSize -> Ptr CUChar -> IO (Ptr ())
#ccall mpd_sh_alloc , CSize -> CSize -> CSize -> IO (Ptr ())
#ccall mpd_qnew , IO (Ptr <mpd_t>)
#ccall mpd_new , Ptr <mpd_context_t> -> IO (Ptr <mpd_t>)
#ccall mpd_qnew_size , CInt -> IO (Ptr <mpd_t>)
#ccall mpd_del , Ptr <mpd_t> -> IO ()
#ccall mpd_uint_zero , Ptr CULong -> CSize -> IO ()
#ccall mpd_qresize , Ptr <mpd_t> -> CInt -> Ptr CUInt -> IO CInt
#ccall mpd_qresize_zero , Ptr <mpd_t> -> CInt -> Ptr CUInt -> IO CInt
#ccall mpd_minalloc , Ptr <mpd_t> -> IO ()
#ccall mpd_resize , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO CInt
#ccall mpd_resize_zero , Ptr <mpd_t> -> CInt -> Ptr <mpd_context_t> -> IO CInt