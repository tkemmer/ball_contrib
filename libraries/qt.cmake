# -----------------------------------------------------------------------------
#   BALL - Biochemical ALgorithms Library
#   A C++ framework for molecular modeling and structural bioinformatics.
# -----------------------------------------------------------------------------
#
# Copyright (C) 1996-2012, the BALL Team:
#  - Andreas Hildebrandt
#  - Oliver Kohlbacher
#  - Hans-Peter Lenhof
#  - Eberhard Karls University, Tuebingen
#  - Saarland University, Saarbrücken
#  - others
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library (BALL/source/LICENSE); if not, write
#  to the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
#  Boston, MA  02111-1307  USA
#
# -----------------------------------------------------------------------------
# $Maintainer: Philipp Thiel $
# $Authors: Philipp Thiel $
# -----------------------------------------------------------------------------

MSG_CONFIGURE_PACKAGE_BEGIN("${PACKAGE_NAME}")

FIND_PACKAGE(Perl QUIET)
IF(NOT PERL_EXECUTABLE)
	IF(NOT OS_WINDOWS)
                MESSAGE(SEND_ERROR "Compiling Qt requires Perl! Cannot continue!")
	ELSE()
                MESSAGE(SEND_ERROR "Compiling Qt requires Perl! Please install ActivePerl from http://www.activestate.com/downloads")
	ENDIF()
ENDIF()

# TODO: openssl

IF(MSVC) # Windows
        SET(QT_CONFIGURE_COMMAND configure.bat)
        SET(QT_BUILD_COMMAND cmake -DTHREADS=${THREADS} -P "${PROJECT_SOURCE_DIR}/cmake/InvokeNmake.cmake")
	SET(QT_INSTALL_COMMAND nmake install)
ELSE() # Linux / Darwin
        SET(QT_CONFIGURE_COMMAND ./configure)
	SET(QT_BUILD_COMMAND make "-j${THREADS}" "module-qtwebkit")
	SET(QT_INSTALL_COMMAND make "module-qtwebkit-install_subtargets")
ENDIF()

ExternalProject_Add(${PACKAGE_NAME}

	URL "${CONTRIB_ARCHIVES_URL}/${${PACKAGE_NAME}_archive}"
	PREFIX ${PROJECT_BINARY_DIR}
	BUILD_IN_SOURCE ${CUSTOM_BUILD_IN_SOURCE}

	LOG_DOWNLOAD ${CUSTOM_LOG_DOWNLOAD}
	LOG_UPDATE ${CUSTOM_LOG_UPDATE}
	LOG_CONFIGURE ${CUSTOM_LOG_CONFIGURE}
	LOG_BUILD ${CUSTOM_LOG_BUILD}
	LOG_INSTALL ${CUSTOM_LOG_INSTALL}

	CONFIGURE_COMMAND ${QT_CONFIGURE_COMMAND}
		-prefix "${CONTRIB_INSTALL_BASE}"
		-nomake examples
		-no-nis
		-no-harfbuzz
		-opensource
		-confirm-license
		-qt-xcb 

	BUILD_COMMAND ${QT_BUILD_COMMAND}
	INSTALL_COMMAND ${QT_INSTALL_COMMAND}
)

MSG_CONFIGURE_PACKAGE_END("${PACKAGE_NAME}")
