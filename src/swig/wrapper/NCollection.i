/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define NCOLLECTIONDOCSTRING
"NCollection module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_ncollection.html"
%enddef
%module (package="OCC.Core", docstring=NCOLLECTIONDOCSTRING) NCollection


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<NCollection_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i

%include "../../include/opencascade/NCollection_TypeDef.hxx";
%include "../../include/opencascade/NCollection_Array1.hxx";
%include "../../include/opencascade/NCollection_Array2.hxx";
%include "../../include/opencascade/NCollection_Map.hxx";
%include "../../include/opencascade/NCollection_DefaultHasher.hxx";
%include "../../include/opencascade/NCollection_List.hxx";
%include "../../include/opencascade/NCollection_Sequence.hxx";
%include "../../include/opencascade/NCollection_DataMap.hxx";
%include "../../include/opencascade/NCollection_IndexedMap.hxx";
%include "../../include/opencascade/NCollection_IndexedDataMap.hxx";
%include "../../include/opencascade/NCollection_DoubleMap.hxx";
%include "../../include/opencascade/NCollection_DefineAlloc.hxx";
%include "../../include/opencascade/Standard_Macro.hxx";
%include "../../include/opencascade/Standard_DefineAlloc.hxx";
%include "../../include/opencascade/NCollection_UBTree.hxx";
%include "../../include/opencascade/NCollection_UBTreeFiller.hxx";
%include "../../include/opencascade/NCollection_Lerp.hxx";
%include "../../include/opencascade/NCollection_Vector.hxx";
%include "../../include/opencascade/NCollection_Vec2.hxx";
%include "../../include/opencascade/NCollection_Vec3.hxx";
%include "../../include/opencascade/NCollection_Vec4.hxx";
%include "../../include/opencascade/NCollection_Mat4.hxx";
%include "../../include/opencascade/NCollection_TListIterator.hxx";
%include "../../include/opencascade/NCollection_UtfString.hxx";
%include "../../include/opencascade/NCollection_UtfIterator.hxx";
%include "../../include/opencascade/NCollection_SparseArray.hxx";

%ignore NCollection_List::First();
%ignore NCollection_List::Last();
%ignore NCollection_TListIterator::Value();
/* public enums */
/* end public enums declaration */

/* typedefs */
typedef NCollection_UtfString <Standard_Utf8Char> NCollection_Utf8String;
typedef NCollection_UtfString <Standard_Utf16Char> NCollection_Utf16String;
typedef NCollection_UtfString <Standard_Utf32Char> NCollection_Utf32String;
typedef NCollection_UtfString <Standard_WideChar> NCollection_UtfWideString;
typedef void ( * NCollection_DelMapNode ) ( NCollection_ListNode * , opencascade::handle <NCollection_BaseAllocator>& theAl );
typedef NCollection_UtfIterator <Standard_Utf8Char> NCollection_Utf8Iter;
typedef NCollection_UtfIterator <Standard_Utf16Char> NCollection_Utf16Iter;
typedef NCollection_UtfIterator <Standard_Utf32Char> NCollection_Utf32Iter;
typedef NCollection_UtfIterator <Standard_WideChar> NCollection_UtfWideIter;
typedef size_t Standard_Size;
typedef NCollection_Utf8String NCollection_String;
/* end typedefs declaration */

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
