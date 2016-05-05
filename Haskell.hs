
import Foreign
import Foreign.C.Types

foreign import stdcall safe "jni.h JNI_GetDefaultJavaVMInitArgs"
    getDefaultJavaVMInitArgs :: Ptr () -> IO Int64

foreign import stdcall safe "jni.h JNI_CreateJavaVM"
    createJavaVM :: Ptr () -> Ptr () -> Ptr () -> IO Int64

main :: IO ()
main = do
    args <- mallocBytes 10000

    a1 <- mallocBytes 10000
    a2 <- mallocBytes 10000

    poke (castPtr args) (0x00010006 :: CLong)
    print =<< getDefaultJavaVMInitArgs args
    -- alloca $ \a1 -> alloca $ \a2 ->
    print =<< createJavaVM a1 a2 args


