# - find DCMTK libraries
#
	
#  DCMTK_INCLUDE_DIR   - Directories to include to use DCMTK
#  DCMTK_LIBRARIES     - Files to link against to use DCMTK
#  DCMTK_FOUND         - If false, don't try to use DCMTK
#  DCMTK_DIR           - (optional) Source directory for DCMTK
#
# DCMTK_DIR can be used to make it simpler to find the various include
# directories and compiled libraries if you've just compiled it in the
# source tree. Just set it to the root of the tree where you extracted
# the source.
#
# Written for VXL by Amitha Perera.
# 

UNSET(DCMTK_FOUND)

# Construct consitent error messages for use below.
SET(DCMTK_DIR_DESCRIPTION "directory containing DCMTK install files.  This is either the root of the build or install tree.")
SET(DCMTK_DIR_MESSAGE "DCMTK not found.  Set the DCMTK_DIR cmake cache entry to the ${DCMTK_DIR_DESCRIPTION}")

SET(DCMTK_DIR $ENV{DCMTK_DIR})

FIND_PATH( DCMTK_root_INCLUDE_DIR dcmtk/config/osconfig.h
  PATHS
  ${DCMTK_DIR}/include
)

FIND_PATH( DCMTK_config_INCLUDE_DIR osconfig.h
  ${DCMTK_DIR}/config/include
  ${DCMTK_DIR}/include/config
  ${DCMTK_DIR}/include/dcmtk/config
)

FIND_PATH( DCMTK_ofstd_INCLUDE_DIR ofstdinc.h
  ${DCMTK_DIR}/ofstd/include
  ${DCMTK_DIR}/include/ofstd
  ${DCMTK_DIR}/include/dcmtk/ofstd
)

FIND_LIBRARY( DCMTK_ofstd_LIBRARY ofstd
  ${DCMTK_DIR}/ofstd/libsrc
  ${DCMTK_DIR}/ofstd/libsrc/Release
  ${DCMTK_DIR}/ofstd/libsrc/Debug
  ${DCMTK_DIR}/ofstd/Release
  ${DCMTK_DIR}/ofstd/Debug
  ${DCMTK_DIR}/lib
)

FIND_PATH( DCMTK_dcmdata_INCLUDE_DIR dctypes.h
  ${DCMTK_DIR}/dcmdata/include
  ${DCMTK_DIR}/include/dcmdata
  ${DCMTK_DIR}/include/dcmtk/dcmdata
)

FIND_LIBRARY( DCMTK_dcmdata_LIBRARY dcmdata
  ${DCMTK_DIR}/dcmdata/libsrc
  ${DCMTK_DIR}/dcmdata/libsrc/Release
  ${DCMTK_DIR}/dcmdata/libsrc/Debug
  ${DCMTK_DIR}/dcmdata/Release
  ${DCMTK_DIR}/dcmdata/Debug
  ${DCMTK_DIR}/lib
)

FIND_PATH( DCMTK_dcmimgle_INCLUDE_DIR dcmimage.h
  ${DCMTK_DIR}/dcmimgle/include
  ${DCMTK_DIR}/include/dcmimgle
  ${DCMTK_DIR}/include/dcmtk/dcmimgle
)

FIND_LIBRARY( DCMTK_dcmimgle_LIBRARY dcmimgle
  ${DCMTK_DIR}/dcmimgle/libsrc
  ${DCMTK_DIR}/dcmimgle/libsrc/Release
  ${DCMTK_DIR}/dcmimgle/libsrc/Debug
  ${DCMTK_DIR}/dcmimgle/Release
  ${DCMTK_DIR}/dcmimgle/Debug
  ${DCMTK_DIR}/lib
)

FIND_PATH( DCMTK_dcmjpeg_INCLUDE_DIR djdecode.h
  ${DCMTK_DIR}/dcmjpeg/include
  ${DCMTK_DIR}/include/dcmjpeg
  ${DCMTK_DIR}/include/dcmtk/dcmjpeg
)

FIND_LIBRARY( DCMTK_dcmjpeg_LIBRARY dcmjpeg
  ${DCMTK_DIR}/dcmjpeg/libsrc
  ${DCMTK_DIR}/dcmjpeg/libsrc/Release
  ${DCMTK_DIR}/dcmjpeg/libsrc/Debug
  ${DCMTK_DIR}/dcmjpeg/Release
  ${DCMTK_DIR}/dcmjpeg/Debug
  ${DCMTK_DIR}/lib
)

FIND_LIBRARY( DCMTK_ijg8_LIBRARY ijg8
  ${DCMTK_DIR}/dcmjpeg/libijg8/
  ${DCMTK_DIR}/dcmjpeg/libijg8/Release
  ${DCMTK_DIR}/dcmjpeg/libijg8/Debug
  ${DCMTK_DIR}/lib
)

FIND_LIBRARY( DCMTK_ijg12_LIBRARY ijg12
  ${DCMTK_DIR}/dcmjpeg/libijg12/
  ${DCMTK_DIR}/dcmjpeg/libijg12/Release
  ${DCMTK_DIR}/dcmjpeg/libijg12/Debug
  ${DCMTK_DIR}/lib
)

FIND_LIBRARY( DCMTK_ijg16_LIBRARY ijg16
  ${DCMTK_DIR}/dcmjpeg/libijg16/
  ${DCMTK_DIR}/dcmjpeg/libijg16/Release
  ${DCMTK_DIR}/dcmjpeg/libijg16/Debug
  ${DCMTK_DIR}/lib
)

FIND_LIBRARY(DCMTK_imagedb_LIBRARY imagedb 
  ${DCMTK_DIR}/imagectn/libsrc/Release
  ${DCMTK_DIR}/imagectn/libsrc/
  ${DCMTK_DIR}/imagectn/libsrc/Debug
  ${DCMTK_DIR}/lib
)

FIND_LIBRARY(DCMTK_dcmnet_LIBRARY dcmnet 
  ${DCMTK_DIR}/dcmnet/libsrc/Release
  ${DCMTK_DIR}/dcmnet/libsrc/Debug
  ${DCMTK_DIR}/dcmnet/libsrc/
  ${DCMTK_DIR}/lib
)

IF( DCMTK_root_INCLUDE_DIR
    AND DCMTK_config_INCLUDE_DIR 
    AND DCMTK_ofstd_INCLUDE_DIR 
    AND DCMTK_ofstd_LIBRARY
    AND DCMTK_dcmdata_INCLUDE_DIR
    AND DCMTK_dcmdata_LIBRARY
    AND DCMTK_dcmimgle_INCLUDE_DIR
    AND DCMTK_dcmimgle_LIBRARY 
    AND DCMTK_dcmjpeg_LIBRARY )

  SET( DCMTK_FOUND 1)

  SET( DCMTK_INCLUDE_DIR
    ${DCMTK_root_INCLUDE_DIR}
    ${DCMTK_config_INCLUDE_DIR}
    ${DCMTK_ofstd_INCLUDE_DIR}
    ${DCMTK_dcmdata_INCLUDE_DIR}
    ${DCMTK_dcmimgle_INCLUDE_DIR}
    ${DCMTK_dcmjpeg_INCLUDE_DIR}
  )

  SET( DCMTK_LIBRARIES
    ${DCMTK_dcmjpeg_LIBRARY}
    ${DCMTK_ijg8_LIBRARY}
    ${DCMTK_ijg12_LIBRARY}
    ${DCMTK_ijg16_LIBRARY}
    ${DCMTK_dcmimgle_LIBRARY}
    ${DCMTK_dcmdata_LIBRARY}
    ${DCMTK_ofstd_LIBRARY}
    ${DCMTK_config_LIBRARY}    
  )
  IF(NOT WIN32)
    SET( DCMTK_LIBRARIES
    ${DCMTK_LIBRARIES}
    z
    )   
  ENDIF(NOT WIN32)
  
IF(DCMTK_imagedb_LIBRARY)
  SET( DCMTK_LIBRARIES
    ${DCMTK_LIBRARIES}
    ${DCMTK_imagedb_LIBRARY}
    )
ENDIF(DCMTK_imagedb_LIBRARY)

IF(DCMTK_dcmnet_LIBRARY)
  SET( DCMTK_LIBRARIES
    ${DCMTK_LIBRARIES}
    ${DCMTK_dcmnet_LIBRARY}
    )
ENDIF(DCMTK_dcmnet_LIBRARY)

IF( WIN32 )
  SET( DCMTK_LIBRARIES ${DCMTK_LIBRARIES} netapi32 )
ENDIF( WIN32 )

ENDIF( DCMTK_root_INCLUDE_DIR
    AND DCMTK_config_INCLUDE_DIR 
    AND DCMTK_ofstd_INCLUDE_DIR 
    AND DCMTK_ofstd_LIBRARY
    AND DCMTK_dcmdata_INCLUDE_DIR
    AND DCMTK_dcmdata_LIBRARY
    AND DCMTK_dcmimgle_INCLUDE_DIR
    AND DCMTK_dcmimgle_LIBRARY
    AND DCMTK_dcmjpeg_LIBRARY )

#-----------------------------------------------------------------------------
IF(DCMTK_FOUND)
  
ELSE(DCMTK_FOUND)

  SET( DCMTK_DIR "" CACHE PATH ${DCMTK_DIR_MESSAGE} )
  
  # DCMTK not found, explain to the user how to specify its location.
  IF(DCMTK2_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR ${DCMTK_DIR_MESSAGE})
  ELSE(DCMTK2_FIND_REQUIRED)
    IF(NOT DCMTK2_FIND_QUIETLY)
      MESSAGE(STATUS ${DCMTK_DIR_MESSAGE})
    ENDIF(NOT DCMTK2_FIND_QUIETLY)
  ENDIF(DCMTK2_FIND_REQUIRED)
  
ENDIF(DCMTK_FOUND)
