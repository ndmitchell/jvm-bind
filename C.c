
#include "jni.h"
#include <stdlib.h>     /* malloc, free, rand */


void main()
{
    JavaVM *jvm;       /* denotes a Java VM */
    JNIEnv *env;       /* pointer to native method interface */
    JavaVMInitArgs vm_args; /* JDK/JRE 6 VM initialization arguments */
    vm_args.version = JNI_VERSION_1_6;
    jint res1 = JNI_GetDefaultJavaVMInitArgs(&vm_args);

    printf("am here %ld\n", res1);
    /* load and initialize a Java VM, return a JNI interface
     * pointer in env */
    jint res2 = JNI_CreateJavaVM(&jvm, (void**)&env, &vm_args);

    printf("am here %ld %ld\n", res1, res2);

#if 0

    JavaVM *jvm;       /* denotes a Java VM */
    JNIEnv *env;       /* pointer to native method interface */
    long* args = (long*) malloc(10000);
    args[0] = 0x00010006;
    long res1 = JNI_GetDefaultJavaVMInitArgs(args);
    printf("Worked! %ld\n", res1);
    long res2 = JNI_CreateJavaVM(&jvm, (void**)&env, args);
    printf("Worked! %ld\n", res2);
#endif
}
