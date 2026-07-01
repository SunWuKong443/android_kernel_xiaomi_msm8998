#!/bin/bash

# Some logics of this script are copied from [scripts/build_kernel]. Thanks to UtsavBalar1231.

# Ensure the script exits on error
set -e

# cp out/arch/arm64/boot/Image anykernel/kernels/aosp/kernel
# cp out/arch/arm64/boot/dtb anykernel/kernels/aosp/kernel_dtb
# cp out/arch/arm64/boot/dtbo.img anykernel/kernels/aosp/
cp out/arch/arm64/boot/Image.gz-dtb anykernel/kernels/aosp/

cd anykernel 

ZIP_FILENAME=Sagit_$(date +'%Y%m%d_%H%M%S')_anykernel3_${GIT_COMMIT_ID}.zip

zip -r9 $ZIP_FILENAME ./* -x .git .gitignore out/ ./*.zip
# zip -r9 Sagit.zip ./* -x .git .gitignore out/ ./*.zip

mv $ZIP_FILENAME ../

cd ..


echo "Build for AOSP finished."

# ------------- End of Building for AOSP -------------
#  If you don't need AOSP you can comment out the above block [Building for AOSP]

# cd anykernel 

# ZIP_FILENAME=APTKernel_MIUI_${TARGET_DEVICE}_${KSU_ZIP_STR}_$(date +'%Y%m%d_%H%M%S')_anykernel3_${GIT_COMMIT_ID}.zip

# zip -r9 $ZIP_FILENAME ./* -x .git .gitignore out/ ./*.zip

# mv $ZIP_FILENAME ../

# cd ..

echo "Done. The flashable zip is: [./$ZIP_FILENAME]"
