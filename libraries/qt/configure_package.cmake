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

# Download archive
SET(PACKAGE_ARCHIVE "qt-everywhere-opensource-src-5.4.1.tar.gz")
SET(ARCHIVE_MD5 "90f3fbce38ed16e5dc2cd0909ae86ca4")
FETCH_PACKAGE_ARCHIVE(${PACKAGE_ARCHIVE} ${ARCHIVE_MD5})


IF(OS_WINDOWS)

	# Windows

ELSE()

	# Linux / Darwin

	ExternalProject_Add(${PACKAGE_NAME}

		URL "${CONTRIB_ARCHIVES_PATH}/${PACKAGE_ARCHIVE}"
		PREFIX ${PROJECT_BINARY_DIR}

		BUILD_IN_SOURCE ${CUSTOM_BUILD_IN_SOURCE}

		LOG_DOWNLOAD ${CUSTOM_LOG_DOWNLOAD}
		LOG_UPDATE ${CUSTOM_LOG_UPDATE}
		LOG_CONFIGURE ${CUSTOM_LOG_CONFIGURE}
		LOG_BUILD ${CUSTOM_LOG_BUILD}
		LOG_INSTALL ${CUSTOM_LOG_INSTALL}

		CONFIGURE_COMMAND ""
		BUILD_COMMAND ""
		INSTALL_COMMAND ""
	)

ENDIF()

MSG_CONFIGURE_PACKAGE_END("${PACKAGE_NAME}")