/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define BOPALGODOCSTRING
"BOPAlgo module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bopalgo.html"
%enddef
%module (package="OCC.Core", docstring=BOPALGODOCSTRING) BOPAlgo


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
#include "../headers/BOPAlgo_module.hxx>

//Dependencies
#include "../headers/Standard_module.hxx>
#include "../headers/NCollection_module.hxx>
#include "../headers/TopoDS_module.hxx>
#include "../headers/TopTools_module.hxx>
#include "../headers/Message_module.hxx>
#include "../headers/IntTools_module.hxx>
#include "../headers/BOPDS_module.hxx>
#include "../headers/BRepTools_module.hxx>
#include "../headers/BOPTools_module.hxx>
#include "../headers/TopAbs_module.hxx>
#include "../headers/Geom2d_module.hxx>
#include "../headers/Extrema_module.hxx>
#include "../headers/BRepAdaptor_module.hxx>
#include "../headers/Adaptor2d_module.hxx>
#include "../headers/Adaptor3d_module.hxx>
#include "../headers/GeomAdaptor_module.hxx>
#include "../headers/TopLoc_module.hxx>
#include "../headers/Approx_module.hxx>
#include "../headers/IntPatch_module.hxx>
#include "../headers/Geom_module.hxx>
#include "../headers/Geom2dAdaptor_module.hxx>
#include "../headers/AppParCurves_module.hxx>
#include "../headers/Bnd_module.hxx>
#include "../headers/IntTools_module.hxx>
#include "../headers/BRep_module.hxx>
#include "../headers/TShort_module.hxx>
#include "../headers/Poly_module.hxx>
#include "../headers/TColgp_module.hxx>
#include "../headers/TColStd_module.hxx>
#include "../headers/TCollection_module.hxx>
#include "../headers/Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TopTools.i
%import Message.i
%import IntTools.i
%import BOPDS.i
%import BRepTools.i
%import BOPTools.i
%import TopAbs.i
/* public enums */
enum BOPAlgo_CheckStatus {
	BOPAlgo_CheckUnknown = 0,
	BOPAlgo_BadType = 1,
	BOPAlgo_SelfIntersect = 2,
	BOPAlgo_TooSmallEdge = 3,
	BOPAlgo_NonRecoverableFace = 4,
	BOPAlgo_IncompatibilityOfVertex = 5,
	BOPAlgo_IncompatibilityOfEdge = 6,
	BOPAlgo_IncompatibilityOfFace = 7,
	BOPAlgo_OperationAborted = 8,
	BOPAlgo_GeomAbs_C0 = 9,
	BOPAlgo_InvalidCurveOnSurface = 10,
	BOPAlgo_NotValid = 11,
};

enum BOPAlgo_GlueEnum {
	BOPAlgo_GlueOff = 0,
	BOPAlgo_GlueShift = 1,
	BOPAlgo_GlueFull = 2,
};

enum BOPAlgo_Operation {
	BOPAlgo_COMMON = 0,
	BOPAlgo_FUSE = 1,
	BOPAlgo_CUT = 2,
	BOPAlgo_CUT21 = 3,
	BOPAlgo_SECTION = 4,
	BOPAlgo_UNKNOWN = 5,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(BOPAlgo_ListOfCheckResult) NCollection_List<BOPAlgo_CheckResult>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List<BOPAlgo_CheckResult> BOPAlgo_ListOfCheckResult;
typedef BOPAlgo_ListOfCheckResult::Iterator BOPAlgo_ListIteratorOfListOfCheckResult;
typedef BOPAlgo_ArgumentAnalyzer * BOPAlgo_PArgumentAnalyzer;
typedef BOPAlgo_BOP * BOPAlgo_PBOP;
typedef BOPAlgo_Builder * BOPAlgo_PBuilder;
typedef BOPAlgo_PaveFiller * BOPAlgo_PPaveFiller;
typedef BOPAlgo_Section * BOPAlgo_PSection;
typedef BOPAlgo_WireEdgeSet * BOPAlgo_PWireEdgeSet;
/* end typedefs declaration */

/****************************
* class BOPAlgo_CheckResult *
****************************/
class BOPAlgo_CheckResult {
	public:
		/****************** AddFaultyShape1 ******************/
		%feature("compactdefaultargs") AddFaultyShape1;
		%feature("autodoc", "Adds faulty sub-shapes from object to a list.

	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None
") AddFaultyShape1;
		void AddFaultyShape1(const TopoDS_Shape & TheShape);

		/****************** AddFaultyShape2 ******************/
		%feature("compactdefaultargs") AddFaultyShape2;
		%feature("autodoc", "Adds faulty sub-shapes from tool to a list.

	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None
") AddFaultyShape2;
		void AddFaultyShape2(const TopoDS_Shape & TheShape);

		/****************** BOPAlgo_CheckResult ******************/
		%feature("compactdefaultargs") BOPAlgo_CheckResult;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_CheckResult;
		 BOPAlgo_CheckResult();

		/****************** GetCheckStatus ******************/
		%feature("compactdefaultargs") GetCheckStatus;
		%feature("autodoc", "Gets status of faulty.

	:rtype: BOPAlgo_CheckStatus
") GetCheckStatus;
		BOPAlgo_CheckStatus GetCheckStatus();

		/****************** GetFaultyShapes1 ******************/
		%feature("compactdefaultargs") GetFaultyShapes1;
		%feature("autodoc", "Returns list of faulty shapes for object.

	:rtype: TopTools_ListOfShape
") GetFaultyShapes1;
		const TopTools_ListOfShape & GetFaultyShapes1();

		/****************** GetFaultyShapes2 ******************/
		%feature("compactdefaultargs") GetFaultyShapes2;
		%feature("autodoc", "Returns list of faulty shapes for tool.

	:rtype: TopTools_ListOfShape
") GetFaultyShapes2;
		const TopTools_ListOfShape & GetFaultyShapes2();

		/****************** GetMaxDistance1 ******************/
		%feature("compactdefaultargs") GetMaxDistance1;
		%feature("autodoc", "Returns the distance for the first shape.

	:rtype: float
") GetMaxDistance1;
		Standard_Real GetMaxDistance1();

		/****************** GetMaxDistance2 ******************/
		%feature("compactdefaultargs") GetMaxDistance2;
		%feature("autodoc", "Returns the distance for the second shape.

	:rtype: float
") GetMaxDistance2;
		Standard_Real GetMaxDistance2();

		/****************** GetMaxParameter1 ******************/
		%feature("compactdefaultargs") GetMaxParameter1;
		%feature("autodoc", "Returns the parameter for the fircst shape.

	:rtype: float
") GetMaxParameter1;
		Standard_Real GetMaxParameter1();

		/****************** GetMaxParameter2 ******************/
		%feature("compactdefaultargs") GetMaxParameter2;
		%feature("autodoc", "Returns the parameter for the second shape.

	:rtype: float
") GetMaxParameter2;
		Standard_Real GetMaxParameter2();

		/****************** GetShape1 ******************/
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "Returns ancestor shape (object) for faulties.

	:rtype: TopoDS_Shape
") GetShape1;
		const TopoDS_Shape GetShape1();

		/****************** GetShape2 ******************/
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "Returns ancestor shape (tool) for faulties.

	:rtype: TopoDS_Shape
") GetShape2;
		const TopoDS_Shape GetShape2();

		/****************** SetCheckStatus ******************/
		%feature("compactdefaultargs") SetCheckStatus;
		%feature("autodoc", "Set status of faulty.

	:param TheStatus:
	:type TheStatus: BOPAlgo_CheckStatus
	:rtype: None
") SetCheckStatus;
		void SetCheckStatus(const BOPAlgo_CheckStatus TheStatus);

		/****************** SetMaxDistance1 ******************/
		%feature("compactdefaultargs") SetMaxDistance1;
		%feature("autodoc", "Sets max distance for the first shape.

	:param theDist:
	:type theDist: float
	:rtype: None
") SetMaxDistance1;
		void SetMaxDistance1(const Standard_Real theDist);

		/****************** SetMaxDistance2 ******************/
		%feature("compactdefaultargs") SetMaxDistance2;
		%feature("autodoc", "Sets max distance for the second shape.

	:param theDist:
	:type theDist: float
	:rtype: None
") SetMaxDistance2;
		void SetMaxDistance2(const Standard_Real theDist);

		/****************** SetMaxParameter1 ******************/
		%feature("compactdefaultargs") SetMaxParameter1;
		%feature("autodoc", "Sets the parameter for the first shape.

	:param thePar:
	:type thePar: float
	:rtype: None
") SetMaxParameter1;
		void SetMaxParameter1(const Standard_Real thePar);

		/****************** SetMaxParameter2 ******************/
		%feature("compactdefaultargs") SetMaxParameter2;
		%feature("autodoc", "Sets the parameter for the second shape.

	:param thePar:
	:type thePar: float
	:rtype: None
") SetMaxParameter2;
		void SetMaxParameter2(const Standard_Real thePar);

		/****************** SetShape1 ******************/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "Sets ancestor shape (object) for faulty sub-shapes.

	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None
") SetShape1;
		void SetShape1(const TopoDS_Shape & TheShape);

		/****************** SetShape2 ******************/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "Sets ancestor shape (tool) for faulty sub-shapes.

	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None
") SetShape2;
		void SetShape2(const TopoDS_Shape & TheShape);

};


/************************
* class BOPAlgo_Options *
************************/
class BOPAlgo_Options {
	public:
		/****************** AddError ******************/
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "Adds the alert as error (fail).

	:param theAlert:
	:type theAlert: Message_Alert
	:rtype: None
") AddError;
		void AddError(const opencascade::handle<Message_Alert> & theAlert);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Adds the alert as warning.

	:param theAlert:
	:type theAlert: Message_Alert
	:rtype: None
") AddWarning;
		void AddWarning(const opencascade::handle<Message_Alert> & theAlert);

		/****************** Allocator ******************/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Returns allocator.

	:rtype: opencascade::handle<NCollection_BaseAllocator>
") Allocator;
		const opencascade::handle<NCollection_BaseAllocator> & Allocator();

		/****************** BOPAlgo_Options ******************/
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_Options;
		 BOPAlgo_Options();

		/****************** BOPAlgo_Options ******************/
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "Constructor with allocator.

	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_Options;
		 BOPAlgo_Options(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all warnings and errors, and any data cached by the algorithm. user defined options are not cleared.

	:rtype: None
") Clear;
		virtual void Clear();

		/****************** ClearWarnings ******************/
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "Clears the warnings of the algorithm.

	:rtype: None
") ClearWarnings;
		void ClearWarnings();


        %feature("autodoc", "1");
        %extend{
            std::string DumpErrorsToString() {
            std::stringstream s;
            self->DumpErrors(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string DumpWarningsToString() {
            std::stringstream s;
            self->DumpWarnings(s);
            return s.str();}
        };
		/****************** FuzzyValue ******************/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Returns the additional tolerance.

	:rtype: float
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****************** GetParallelMode ******************/
		%feature("compactdefaultargs") GetParallelMode;
		%feature("autodoc", "Gets the global parallel mode.

	:rtype: bool
") GetParallelMode;
		static Standard_Boolean GetParallelMode();

		/****************** GetReport ******************/
		%feature("compactdefaultargs") GetReport;
		%feature("autodoc", "Returns report collecting all errors and warnings.

	:rtype: opencascade::handle<Message_Report>
") GetReport;
		const opencascade::handle<Message_Report> & GetReport();

		/****************** HasError ******************/
		%feature("compactdefaultargs") HasError;
		%feature("autodoc", "Returns true if algorithm has generated error of specified type.

	:param theType:
	:type theType: Standard_Type
	:rtype: bool
") HasError;
		Standard_Boolean HasError(const opencascade::handle<Standard_Type> & theType);

		/****************** HasErrors ******************/
		%feature("compactdefaultargs") HasErrors;
		%feature("autodoc", "Returns true if algorithm has failed.

	:rtype: bool
") HasErrors;
		Standard_Boolean HasErrors();

		/****************** HasWarning ******************/
		%feature("compactdefaultargs") HasWarning;
		%feature("autodoc", "Returns true if algorithm has generated warning of specified type.

	:param theType:
	:type theType: Standard_Type
	:rtype: bool
") HasWarning;
		Standard_Boolean HasWarning(const opencascade::handle<Standard_Type> & theType);

		/****************** HasWarnings ******************/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Returns true if algorithm has generated some warning alerts.

	:rtype: bool
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****************** RunParallel ******************/
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "Returns the flag of parallel processing.

	:rtype: bool
") RunParallel;
		Standard_Boolean RunParallel();

		/****************** SetFuzzyValue ******************/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "Sets the additional tolerance.

	:param theFuzz:
	:type theFuzz: float
	:rtype: None
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****************** SetParallelMode ******************/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "Sets the global parallel mode.

	:param theNewMode:
	:type theNewMode: bool
	:rtype: None
") SetParallelMode;
		static void SetParallelMode(const Standard_Boolean theNewMode);

		/****************** SetProgressIndicator ******************/
		%feature("compactdefaultargs") SetProgressIndicator;
		%feature("autodoc", "Set the progress indicator object.

	:param theObj:
	:type theObj: Message_ProgressIndicator
	:rtype: None
") SetProgressIndicator;
		void SetProgressIndicator(const opencascade::handle<Message_ProgressIndicator> & theObj);

		/****************** SetRunParallel ******************/
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "Set the flag of parallel processing if <theflag> is true the parallel processing is switched on if <theflag> is false the parallel processing is switched off.

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetRunParallel;
		void SetRunParallel(const Standard_Boolean theFlag);

		/****************** SetUseOBB ******************/
		%feature("compactdefaultargs") SetUseOBB;
		%feature("autodoc", "Enables/disables the usage of obb.

	:param theUseOBB:
	:type theUseOBB: bool
	:rtype: None
") SetUseOBB;
		void SetUseOBB(const Standard_Boolean theUseOBB);

		/****************** UseOBB ******************/
		%feature("compactdefaultargs") UseOBB;
		%feature("autodoc", "Returns the flag defining usage of obb.

	:rtype: bool
") UseOBB;
		Standard_Boolean UseOBB();

};


/*********************************
* class BOPAlgo_SectionAttribute *
*********************************/
class BOPAlgo_SectionAttribute {
	public:
		/****************** Approximation ******************/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Sets the approximation flag.

	:param theApprox:
	:type theApprox: bool
	:rtype: None
") Approximation;
		void Approximation(const Standard_Boolean theApprox);

		/****************** Approximation ******************/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Returns the approximation flag.

	:rtype: bool
") Approximation;
		Standard_Boolean Approximation();

		/****************** BOPAlgo_SectionAttribute ******************/
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "Default constructor.

	:rtype: None
") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute();

		/****************** BOPAlgo_SectionAttribute ******************/
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "Constructor.

	:param theAproximation:
	:type theAproximation: bool
	:param thePCurveOnS1:
	:type thePCurveOnS1: bool
	:param thePCurveOnS2:
	:type thePCurveOnS2: bool
	:rtype: None
") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute(const Standard_Boolean theAproximation, const Standard_Boolean thePCurveOnS1, const Standard_Boolean thePCurveOnS2);

		/****************** PCurveOnS1 ******************/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "Sets the pcurveons1 flag.

	:param thePCurveOnS1:
	:type thePCurveOnS1: bool
	:rtype: None
") PCurveOnS1;
		void PCurveOnS1(const Standard_Boolean thePCurveOnS1);

		/****************** PCurveOnS1 ******************/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "Returns the pcurveons1 flag.

	:rtype: bool
") PCurveOnS1;
		Standard_Boolean PCurveOnS1();

		/****************** PCurveOnS2 ******************/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "Sets the pcurveons2 flag.

	:param thePCurveOnS2:
	:type thePCurveOnS2: bool
	:rtype: None
") PCurveOnS2;
		void PCurveOnS2(const Standard_Boolean thePCurveOnS2);

		/****************** PCurveOnS2 ******************/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "Returns the pcurveons2 flag.

	:rtype: bool
") PCurveOnS2;
		Standard_Boolean PCurveOnS2();

};


/**********************
* class BOPAlgo_Tools *
**********************/
class BOPAlgo_Tools {
	public:
		/****************** ClassifyFaces ******************/
		%feature("compactdefaultargs") ClassifyFaces;
		%feature("autodoc", "Classifies the faces <thefaces> relatively solids <thesolids>. the in faces for solids are stored into output data map <theinparts>. //! the map <thesolidsif> contains internal faces of the solids, to avoid their additional classification. //! firstly, it checks the intersection of bounding boxes of the shapes. if the box is not stored in the <theshapeboxmap> map, it builds the box. if the bounding boxes of solid and face are interfering the classification is performed. //! it is assumed that all faces and solids are already intersected and do not have any geometrically coinciding parts without topological sharing of these parts.

	:param theFaces:
	:type theFaces: TopTools_ListOfShape
	:param theSolids:
	:type theSolids: TopTools_ListOfShape
	:param theRunParallel:
	:type theRunParallel: bool
	:param theContext:
	:type theContext: IntTools_Context
	:param theInParts:
	:type theInParts: TopTools_IndexedDataMapOfShapeListOfShape
	:param theShapeBoxMap: default value is TopTools_DataMapOfShapeBox()
	:type theShapeBoxMap: TopTools_DataMapOfShapeBox
	:param theSolidsIF: default value is TopTools_DataMapOfShapeListOfShape()
	:type theSolidsIF: TopTools_DataMapOfShapeListOfShape
	:rtype: None
") ClassifyFaces;
		static void ClassifyFaces(const TopTools_ListOfShape & theFaces, const TopTools_ListOfShape & theSolids, const Standard_Boolean theRunParallel, opencascade::handle<IntTools_Context> & theContext, TopTools_IndexedDataMapOfShapeListOfShape & theInParts, const TopTools_DataMapOfShapeBox & theShapeBoxMap = TopTools_DataMapOfShapeBox(), const TopTools_DataMapOfShapeListOfShape & theSolidsIF = TopTools_DataMapOfShapeListOfShape());

		/****************** ComputeToleranceOfCB ******************/
		%feature("compactdefaultargs") ComputeToleranceOfCB;
		%feature("autodoc", "	:param theCB:
	:type theCB: BOPDS_CommonBlock
	:param theDS:
	:type theDS: BOPDS_PDS
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: float
") ComputeToleranceOfCB;
		static Standard_Real ComputeToleranceOfCB(const opencascade::handle<BOPDS_CommonBlock> & theCB, const BOPDS_PDS theDS, const opencascade::handle<IntTools_Context> & theContext);

		/****************** EdgesToWires ******************/
		%feature("compactdefaultargs") EdgesToWires;
		%feature("autodoc", "Creates planar wires from the given edges. the input edges are expected to be planar. and for the performance sake the method does not check if the edges are really planar. thus, the result wires will also be not planar if the input edges are not planar. the edges may be not shared, but the resulting wires will be sharing the coinciding parts and intersecting parts. the output wires may be non-manifold and contain free and multi-connected vertices. parameters: <theedges> - input edges; <thewires> - output wires; <theshared> - boolean flag which defines whether the input edges are already shared or have to be intersected; <theangtol> - the angular tolerance which will be used for distinguishing the planes in which the edges are located. default value is 1.e-8 which is used for intersection of planes in inttools_faceface. method returns the following error statuses: 0 - in case of success (at least one wire has been built); 1 - in case there are no edges in the given shape; 2 - sharing of the edges has failed.

	:param theEdges:
	:type theEdges: TopoDS_Shape
	:param theWires:
	:type theWires: TopoDS_Shape
	:param theShared: default value is Standard_False
	:type theShared: bool
	:param theAngTol: default value is 1e-8
	:type theAngTol: float
	:rtype: int
") EdgesToWires;
		static Standard_Integer EdgesToWires(const TopoDS_Shape & theEdges, TopoDS_Shape & theWires, const Standard_Boolean theShared = Standard_False, const Standard_Real theAngTol = 1e-8);

		/****************** FillInternals ******************/
		%feature("compactdefaultargs") FillInternals;
		%feature("autodoc", "Classifies the given parts relatively the given solids and fills the solids with the parts classified as internal. //! @param thesolids - the solids to put internals to @param theparts - the parts to classify relatively solids @param theimages - possible images of the parts that has to be classified @param thecontext - cashed geometrical tools to speed-up classifications.

	:param theSolids:
	:type theSolids: TopTools_ListOfShape
	:param theParts:
	:type theParts: TopTools_ListOfShape
	:param theImages:
	:type theImages: TopTools_DataMapOfShapeListOfShape
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: None
") FillInternals;
		static void FillInternals(const TopTools_ListOfShape & theSolids, const TopTools_ListOfShape & theParts, const TopTools_DataMapOfShapeListOfShape & theImages, const opencascade::handle<IntTools_Context> & theContext);

		/****************** IntersectVertices ******************/
		%feature("compactdefaultargs") IntersectVertices;
		%feature("autodoc", "Finds chains of intersecting vertices.

	:param theVertices:
	:type theVertices: TopTools_IndexedDataMapOfShapeReal
	:param theFuzzyValue:
	:type theFuzzyValue: float
	:param theChains:
	:type theChains: TopTools_ListOfListOfShape
	:rtype: None
") IntersectVertices;
		static void IntersectVertices(const TopTools_IndexedDataMapOfShapeReal & theVertices, const Standard_Real theFuzzyValue, TopTools_ListOfListOfShape & theChains);

		/****************** PerformCommonBlocks ******************/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "Create common blocks from the groups of pave blocks of <themblocks> connection map.

	:param theMBlocks:
	:type theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:param theDS:
	:type theDS: BOPDS_PDS
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: None
") PerformCommonBlocks;
		static void PerformCommonBlocks(BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock & theMBlocks, const opencascade::handle<NCollection_BaseAllocator> & theAllocator, BOPDS_PDS & theDS, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** PerformCommonBlocks ******************/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "Create common blocks on faces using the pb->faces connection map <themblocks>.

	:param theMBlocks:
	:type theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfInteger
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:param pDS:
	:type pDS: BOPDS_PDS
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: None
") PerformCommonBlocks;
		static void PerformCommonBlocks(const BOPDS_IndexedDataMapOfPaveBlockListOfInteger & theMBlocks, const opencascade::handle<NCollection_BaseAllocator> & theAllocator, BOPDS_PDS & pDS, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** TreatCompound ******************/
		%feature("compactdefaultargs") TreatCompound;
		%feature("autodoc", "Collect in the output list recursively all non-compound subshapes of the first level of the given shape thes. if a shape presents in the map themfence it is skipped. all shapes put in the output are also added into themfence.

	:param theS:
	:type theS: TopoDS_Shape
	:param theMFence:
	:type theMFence: TopTools_MapOfShape
	:param theLS:
	:type theLS: TopTools_ListOfShape
	:rtype: None
") TreatCompound;
		static void TreatCompound(const TopoDS_Shape & theS, TopTools_MapOfShape & theMFence, TopTools_ListOfShape & theLS);

		/****************** WiresToFaces ******************/
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "Creates planar faces from given planar wires. the method does not check if the wires are really planar. the input wires may be non-manifold but should be shared. the wires located in the same planes and included into other wires will create holes in the faces built from outer wires. the tolerance values of the input shapes may be modified during the operation due to projection of the edges on the planes for creation of 2d curves. parameters: <thewires> - the given wires; <thefaces> - the output faces; <theangtol> - the angular tolerance for distinguishing the planes in which the wires are located. default value is 1.e-8 which is used for intersection of planes in inttools_faceface. method returns true in case of success, i.e. at least one face has been built.

	:param theWires:
	:type theWires: TopoDS_Shape
	:param theFaces:
	:type theFaces: TopoDS_Shape
	:param theAngTol: default value is 1e-8
	:type theAngTol: float
	:rtype: bool
") WiresToFaces;
		static Standard_Boolean WiresToFaces(const TopoDS_Shape & theWires, TopoDS_Shape & theFaces, const Standard_Real theAngTol = 1e-8);

};


/****************************
* class BOPAlgo_WireEdgeSet *
****************************/
class BOPAlgo_WireEdgeSet {
	public:
		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	:param sS:
	:type sS: TopoDS_Shape
	:rtype: None
") AddShape;
		void AddShape(const TopoDS_Shape & sS);

		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "	:param sS:
	:type sS: TopoDS_Shape
	:rtype: None
") AddStartElement;
		void AddStartElement(const TopoDS_Shape & sS);

		/****************** BOPAlgo_WireEdgeSet ******************/
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet();

		/****************** BOPAlgo_WireEdgeSet ******************/
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "	:param aF:
	:type aF: TopoDS_Face
	:rtype: None
") SetFace;
		void SetFace(const TopoDS_Face & aF);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes();

		/****************** StartElements ******************/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") StartElements;
		const TopTools_ListOfShape & StartElements();

};


/*********************
* class BOPAlgo_Algo *
*********************/
%nodefaultctor BOPAlgo_Algo;
%ignore BOPAlgo_Algo::~BOPAlgo_Algo();
class BOPAlgo_Algo : public BOPAlgo_Options {
	public:
		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		virtual void Perform();

};


/******************************
* class BOPAlgo_MakeConnected *
******************************/
class BOPAlgo_MakeConnected : public BOPAlgo_Options {
	public:
		/****************** AddArgument ******************/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "Adds the shape to the arguments. @param thes [in] one of the argument shapes.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: None
") AddArgument;
		void AddArgument(const TopoDS_Shape & theS);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Returns the list of arguments of the operation.

	:rtype: TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** BOPAlgo_MakeConnected ******************/
		%feature("compactdefaultargs") BOPAlgo_MakeConnected;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_MakeConnected;
		 BOPAlgo_MakeConnected();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the contents of the algorithm.

	:rtype: None
") Clear;
		void Clear();

		/****************** ClearRepetitions ******************/
		%feature("compactdefaultargs") ClearRepetitions;
		%feature("autodoc", "Clears the repetitions performed on the periodic shape, keeping the shape periodic.

	:rtype: None
") ClearRepetitions;
		void ClearRepetitions();

		/****************** GetModified ******************/
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "Returns the list of shapes modified from the given shape. @param thes [in] the shape for which the modified shapes are necessary.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") GetModified;
		const TopTools_ListOfShape & GetModified(const TopoDS_Shape & theS);

		/****************** GetOrigins ******************/
		%feature("compactdefaultargs") GetOrigins;
		%feature("autodoc", "Returns the list of original shapes from which the current shape has been created. @param thes [in] the shape for which the origins are necessary.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") GetOrigins;
		const TopTools_ListOfShape & GetOrigins(const TopoDS_Shape & theS);

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of operations.

	:rtype: opencascade::handle<BRepTools_History>
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****************** MakePeriodic ******************/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "Makes the connected shape periodic. repeated calls of this method overwrite the previous calls working with the basis connected shape. @param theparams [in] periodic options.

	:param theParams:
	:type theParams: BOPAlgo_MakePeriodic::PeriodicityParams
	:rtype: None
") MakePeriodic;
		void MakePeriodic(const BOPAlgo_MakePeriodic::PeriodicityParams & theParams);

		/****************** MaterialsOnNegativeSide ******************/
		%feature("compactdefaultargs") MaterialsOnNegativeSide;
		%feature("autodoc", "Returns the original shapes which images contain the the given shape with reversed orientation. @param thes [in] the shape for which the materials are necessary.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") MaterialsOnNegativeSide;
		const TopTools_ListOfShape & MaterialsOnNegativeSide(const TopoDS_Shape & theS);

		/****************** MaterialsOnPositiveSide ******************/
		%feature("compactdefaultargs") MaterialsOnPositiveSide;
		%feature("autodoc", "Returns the original shapes which images contain the the given shape with forward orientation. @param thes [in] the shape for which the materials are necessary.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") MaterialsOnPositiveSide;
		const TopTools_ListOfShape & MaterialsOnPositiveSide(const TopoDS_Shape & theS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation, i.e. makes the input shapes connected.

	:rtype: None
") Perform;
		void Perform();

		/****************** PeriodicShape ******************/
		%feature("compactdefaultargs") PeriodicShape;
		%feature("autodoc", "Returns the resulting periodic & repeated shape.

	:rtype: TopoDS_Shape
") PeriodicShape;
		const TopoDS_Shape PeriodicShape();

		/****************** PeriodicityTool ******************/
		%feature("compactdefaultargs") PeriodicityTool;
		%feature("autodoc", "Returns the periodicity tool.

	:rtype: BOPAlgo_MakePeriodic
") PeriodicityTool;
		const BOPAlgo_MakePeriodic & PeriodicityTool();

		/****************** RepeatShape ******************/
		%feature("compactdefaultargs") RepeatShape;
		%feature("autodoc", "Performs repetition of the periodic shape in specified direction required number of times. @param thedirectionid [in] the direction's id (0 for x, 1 for y, 2 for z); @param thetimes [in] requested number of repetitions (sign of the value defines  the side of the repetition direction (positive or negative)).

	:param theDirectionID:
	:type theDirectionID: int
	:param theTimes:
	:type theTimes: int
	:rtype: None
") RepeatShape;
		void RepeatShape(const Standard_Integer theDirectionID, const Standard_Integer theTimes);

		/****************** SetArguments ******************/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "Sets the shape for making them connected. @param theargs [in] the arguments for the operation.

	:param theArgs:
	:type theArgs: TopTools_ListOfShape
	:rtype: None
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theArgs);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting connected shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


/*****************************
* class BOPAlgo_MakePeriodic *
*****************************/
class BOPAlgo_MakePeriodic : public BOPAlgo_Options {
	public:
		class PeriodicityParams {};
		/****************** BOPAlgo_MakePeriodic ******************/
		%feature("compactdefaultargs") BOPAlgo_MakePeriodic;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_MakePeriodic;
		 BOPAlgo_MakePeriodic();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the algorithm from previous runs.

	:rtype: None
") Clear;
		void Clear();

		/****************** ClearRepetitions ******************/
		%feature("compactdefaultargs") ClearRepetitions;
		%feature("autodoc", "Clears all performed repetitions. the next repetition will be performed on the base shape.

	:rtype: None
") ClearRepetitions;
		void ClearRepetitions();

		/****************** GetTwins ******************/
		%feature("compactdefaultargs") GetTwins;
		%feature("autodoc", "Returns the identical shapes for the given shape located on the opposite periodic side. returns empty list in case the shape has no twin. //! @param thes [in] shape to get the twins for.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") GetTwins;
		const TopTools_ListOfShape & GetTwins(const TopoDS_Shape & theS);

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of the algorithm.

	:rtype: opencascade::handle<BRepTools_History>
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****************** IsInputTrimmed ******************/
		%feature("compactdefaultargs") IsInputTrimmed;
		%feature("autodoc", "Returns whether the input shape was trimmed in the specified direction. @param thedirectionid [in] the direction's id.

	:param theDirectionID:
	:type theDirectionID: int
	:rtype: bool
") IsInputTrimmed;
		Standard_Boolean IsInputTrimmed(const Standard_Integer theDirectionID);

		/****************** IsInputXTrimmed ******************/
		%feature("compactdefaultargs") IsInputXTrimmed;
		%feature("autodoc", "Returns whether the input shape was already trimmed for x period.

	:rtype: bool
") IsInputXTrimmed;
		Standard_Boolean IsInputXTrimmed();

		/****************** IsInputYTrimmed ******************/
		%feature("compactdefaultargs") IsInputYTrimmed;
		%feature("autodoc", "Returns whether the input shape was already trimmed for y period.

	:rtype: bool
") IsInputYTrimmed;
		Standard_Boolean IsInputYTrimmed();

		/****************** IsInputZTrimmed ******************/
		%feature("compactdefaultargs") IsInputZTrimmed;
		%feature("autodoc", "Returns whether the input shape was already trimmed for z period.

	:rtype: bool
") IsInputZTrimmed;
		Standard_Boolean IsInputZTrimmed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns the info about periodicity of the shape in specified direction. @param thedirectionid [in] the direction's id.

	:param theDirectionID:
	:type theDirectionID: int
	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic(const Standard_Integer theDirectionID);

		/****************** IsXPeriodic ******************/
		%feature("compactdefaultargs") IsXPeriodic;
		%feature("autodoc", "Returns the info about periodicity of the shape in x direction.

	:rtype: bool
") IsXPeriodic;
		Standard_Boolean IsXPeriodic();

		/****************** IsYPeriodic ******************/
		%feature("compactdefaultargs") IsYPeriodic;
		%feature("autodoc", "Returns the info about periodicity of the shape in y direction.

	:rtype: bool
") IsYPeriodic;
		Standard_Boolean IsYPeriodic();

		/****************** IsZPeriodic ******************/
		%feature("compactdefaultargs") IsZPeriodic;
		%feature("autodoc", "Returns the info about periodicity of the shape in z direction.

	:rtype: bool
") IsZPeriodic;
		Standard_Boolean IsZPeriodic();

		/****************** MakePeriodic ******************/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "Sets the flag to make the shape periodic in specified direction: - 0 - x direction; - 1 - y direction; - 2 - z direction. //! @param thedirectionid [in] the direction's id; @param theisperiodic [in] flag defining periodicity in given direction; @param theperiod [in] required period in given direction.

	:param theDirectionID:
	:type theDirectionID: int
	:param theIsPeriodic:
	:type theIsPeriodic: bool
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None
") MakePeriodic;
		void MakePeriodic(const Standard_Integer theDirectionID, const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****************** MakeXPeriodic ******************/
		%feature("compactdefaultargs") MakeXPeriodic;
		%feature("autodoc", "Sets the flag to make the shape periodic in x direction. @param theisperiodic [in] flag defining periodicity in x direction; @param theperiod [in] required period in x direction.

	:param theIsPeriodic:
	:type theIsPeriodic: bool
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None
") MakeXPeriodic;
		void MakeXPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****************** MakeYPeriodic ******************/
		%feature("compactdefaultargs") MakeYPeriodic;
		%feature("autodoc", "Sets the flag to make the shape periodic in y direction. @param theisperiodic [in] flag defining periodicity in y direction; @param theperiod [in] required period in y direction.

	:param theIsPeriodic:
	:type theIsPeriodic: bool
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None
") MakeYPeriodic;
		void MakeYPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****************** MakeZPeriodic ******************/
		%feature("compactdefaultargs") MakeZPeriodic;
		%feature("autodoc", "Sets the flag to make the shape periodic in z direction. @param theisperiodic [in] flag defining periodicity in z direction; @param theperiod [in] required period in z direction.

	:param theIsPeriodic:
	:type theIsPeriodic: bool
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None
") MakeZPeriodic;
		void MakeZPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Makes the shape periodic in necessary directions.

	:rtype: None
") Perform;
		void Perform();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of the shape in specified direction. @param thedirectionid [in] the direction's id.

	:param theDirectionID:
	:type theDirectionID: int
	:rtype: float
") Period;
		Standard_Real Period(const Standard_Integer theDirectionID);

		/****************** PeriodFirst ******************/
		%feature("compactdefaultargs") PeriodFirst;
		%feature("autodoc", "Returns the first periodic parameter in the specified direction. @param thedirectionid [in] the direction's id.

	:param theDirectionID:
	:type theDirectionID: int
	:rtype: float
") PeriodFirst;
		Standard_Real PeriodFirst(const Standard_Integer theDirectionID);

		/****************** PeriodicityParameters ******************/
		%feature("compactdefaultargs") PeriodicityParameters;
		%feature("autodoc", "	:rtype: BOPAlgo_MakePeriodic::PeriodicityParams
") PeriodicityParameters;
		BOPAlgo_MakePeriodic::PeriodicityParams PeriodicityParameters();

		/****************** RepeatShape ******************/
		%feature("compactdefaultargs") RepeatShape;
		%feature("autodoc", "Performs repetition of the shape in specified direction required number of times. negative value of times means that the repetition should be perform in negative direction. makes the repeated shape a base for following repetitions. //! @param thedirectionid [in] the direction's id; @param thetimes [in] requested number of repetitions.

	:param theDirectionID:
	:type theDirectionID: int
	:param theTimes:
	:type theTimes: int
	:rtype: TopoDS_Shape
") RepeatShape;
		const TopoDS_Shape RepeatShape(const Standard_Integer theDirectionID, const Standard_Integer theTimes);

		/****************** RepeatedShape ******************/
		%feature("compactdefaultargs") RepeatedShape;
		%feature("autodoc", "Returns the repeated shape.

	:rtype: TopoDS_Shape
") RepeatedShape;
		const TopoDS_Shape RepeatedShape();

		/****************** SetPeriodicityParameters ******************/
		%feature("compactdefaultargs") SetPeriodicityParameters;
		%feature("autodoc", "Sets the periodicity parameters. @param theparams [in] periodicity parameters.

	:param theParams:
	:type theParams: PeriodicityParams
	:rtype: None
") SetPeriodicityParameters;
		void SetPeriodicityParameters(PeriodicityParams theParams);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets the shape to make it periodic. @param theshape [in] the shape to make periodic.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****************** SetTrimmed ******************/
		%feature("compactdefaultargs") SetTrimmed;
		%feature("autodoc", "Defines whether the input shape is already trimmed in specified direction to fit the period in this direction. direction is defined by an id: - 0 - x direction; - 1 - y direction; - 2 - z direction. //! if the shape is not trimmed it is required to set the first parameter of the period in that direction. the algorithm will make the shape fit into the period. //! before calling this method, the shape has to be set to be periodic in this direction. //! @param thedirectionid [in] the direction's id; @param theistrimmed [in] the flag defining trimming of the shape in given direction; @param thefirst [in] the first periodic parameter in the given direction.

	:param theDirectionID:
	:type theDirectionID: int
	:param theIsTrimmed:
	:type theIsTrimmed: bool
	:param theFirst: default value is 0.0
	:type theFirst: float
	:rtype: None
") SetTrimmed;
		void SetTrimmed(const Standard_Integer theDirectionID, const Standard_Boolean theIsTrimmed, const Standard_Real theFirst = 0.0);

		/****************** SetXTrimmed ******************/
		%feature("compactdefaultargs") SetXTrimmed;
		%feature("autodoc", "Defines whether the input shape is already trimmed in x direction to fit the x period. if the shape is not trimmed it is required to set the first parameter for the x period. the algorithm will make the shape fit into the period. //! before calling this method, the shape has to be set to be periodic in this direction. //! @param theistrimmed [in] flag defining whether the shape is already trimmed  in x direction to fit the x period; @param thefirst [in] the first x periodic parameter.

	:param theIsTrimmed:
	:type theIsTrimmed: bool
	:param theFirst: default value is 0.0
	:type theFirst: bool
	:rtype: None
") SetXTrimmed;
		void SetXTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****************** SetYTrimmed ******************/
		%feature("compactdefaultargs") SetYTrimmed;
		%feature("autodoc", "Defines whether the input shape is already trimmed in y direction to fit the y period. if the shape is not trimmed it is required to set the first parameter for the y period. the algorithm will make the shape fit into the period. //! before calling this method, the shape has to be set to be periodic in this direction. //! @param theistrimmed [in] flag defining whether the shape is already trimmed  in y direction to fit the y period; @param thefirst [in] the first y periodic parameter.

	:param theIsTrimmed:
	:type theIsTrimmed: bool
	:param theFirst: default value is 0.0
	:type theFirst: bool
	:rtype: None
") SetYTrimmed;
		void SetYTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****************** SetZTrimmed ******************/
		%feature("compactdefaultargs") SetZTrimmed;
		%feature("autodoc", "Defines whether the input shape is already trimmed in z direction to fit the z period. if the shape is not trimmed it is required to set the first parameter for the z period. the algorithm will make the shape fit into the period. //! before calling this method, the shape has to be set to be periodic in this direction. //! @param theistrimmed [in] flag defining whether the shape is already trimmed  in z direction to fit the z period; @param thefirst [in] the first z periodic parameter.

	:param theIsTrimmed:
	:type theIsTrimmed: bool
	:param theFirst: default value is 0.0
	:type theFirst: bool
	:rtype: None
") SetZTrimmed;
		void SetZTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting periodic shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** ToDirectionID ******************/
		%feature("compactdefaultargs") ToDirectionID;
		%feature("autodoc", "Converts the integer to id of periodic direction.

	:param theDirectionID:
	:type theDirectionID: int
	:rtype: int
") ToDirectionID;
		static Standard_Integer ToDirectionID(const Standard_Integer theDirectionID);

		/****************** XPeriod ******************/
		%feature("compactdefaultargs") XPeriod;
		%feature("autodoc", "Returns the xperiod of the shape.

	:rtype: float
") XPeriod;
		Standard_Real XPeriod();

		/****************** XPeriodFirst ******************/
		%feature("compactdefaultargs") XPeriodFirst;
		%feature("autodoc", "Returns the first parameter for the x period.

	:rtype: float
") XPeriodFirst;
		Standard_Real XPeriodFirst();

		/****************** XRepeat ******************/
		%feature("compactdefaultargs") XRepeat;
		%feature("autodoc", "Repeats the shape in x direction specified number of times. negative value of times means that the repetition should be perform in negative x direction. makes the repeated shape a base for following repetitions. //! @param thetimes [in] requested number of repetitions.

	:param theTimes:
	:type theTimes: int
	:rtype: TopoDS_Shape
") XRepeat;
		const TopoDS_Shape XRepeat(const Standard_Integer theTimes);

		/****************** YPeriod ******************/
		%feature("compactdefaultargs") YPeriod;
		%feature("autodoc", "Returns the yperiod of the shape.

	:rtype: float
") YPeriod;
		Standard_Real YPeriod();

		/****************** YPeriodFirst ******************/
		%feature("compactdefaultargs") YPeriodFirst;
		%feature("autodoc", "Returns the first parameter for the y period.

	:rtype: float
") YPeriodFirst;
		Standard_Real YPeriodFirst();

		/****************** YRepeat ******************/
		%feature("compactdefaultargs") YRepeat;
		%feature("autodoc", "Repeats the shape in y direction specified number of times. negative value of times means that the repetition should be perform in negative y direction. makes the repeated shape a base for following repetitions. //! @param thetimes [in] requested number of repetitions.

	:param theTimes:
	:type theTimes: int
	:rtype: TopoDS_Shape
") YRepeat;
		const TopoDS_Shape YRepeat(const Standard_Integer theTimes);

		/****************** ZPeriod ******************/
		%feature("compactdefaultargs") ZPeriod;
		%feature("autodoc", "Returns the zperiod of the shape.

	:rtype: float
") ZPeriod;
		Standard_Real ZPeriod();

		/****************** ZPeriodFirst ******************/
		%feature("compactdefaultargs") ZPeriodFirst;
		%feature("autodoc", "Returns the first parameter for the z period.

	:rtype: float
") ZPeriodFirst;
		Standard_Real ZPeriodFirst();

		/****************** ZRepeat ******************/
		%feature("compactdefaultargs") ZRepeat;
		%feature("autodoc", "Repeats the shape in z direction specified number of times. negative value of times means that the repetition should be perform in negative z direction. makes the repeated shape a base for following repetitions. //! @param thetimes [in] requested number of repetitions.

	:param theTimes:
	:type theTimes: int
	:rtype: TopoDS_Shape
") ZRepeat;
		const TopoDS_Shape ZRepeat(const Standard_Integer theTimes);

};


/*********************************
* class BOPAlgo_ArgumentAnalyzer *
*********************************/
class BOPAlgo_ArgumentAnalyzer : public BOPAlgo_Algo {
	public:

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetArgumentTypeMode() {
            return (Standard_Boolean) $self->ArgumentTypeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetArgumentTypeMode(Standard_Boolean value) {
            $self->ArgumentTypeMode()=value;
            }
        };
		/****************** BOPAlgo_ArgumentAnalyzer ******************/
		%feature("compactdefaultargs") BOPAlgo_ArgumentAnalyzer;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_ArgumentAnalyzer;
		 BOPAlgo_ArgumentAnalyzer();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetContinuityMode() {
            return (Standard_Boolean) $self->ContinuityMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetContinuityMode(Standard_Boolean value) {
            $self->ContinuityMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetCurveOnSurfaceMode() {
            return (Standard_Boolean) $self->CurveOnSurfaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCurveOnSurfaceMode(Standard_Boolean value) {
            $self->CurveOnSurfaceMode()=value;
            }
        };
		/****************** GetCheckResult ******************/
		%feature("compactdefaultargs") GetCheckResult;
		%feature("autodoc", "Returns a result of test.

	:rtype: BOPAlgo_ListOfCheckResult
") GetCheckResult;
		const BOPAlgo_ListOfCheckResult & GetCheckResult();

		/****************** GetShape1 ******************/
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "Returns object shape;.

	:rtype: TopoDS_Shape
") GetShape1;
		const TopoDS_Shape GetShape1();

		/****************** GetShape2 ******************/
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "Returns tool shape.

	:rtype: TopoDS_Shape
") GetShape2;
		const TopoDS_Shape GetShape2();

		/****************** HasFaulty ******************/
		%feature("compactdefaultargs") HasFaulty;
		%feature("autodoc", "Result of test.

	:rtype: bool
") HasFaulty;
		Standard_Boolean HasFaulty();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetMergeEdgeMode() {
            return (Standard_Boolean) $self->MergeEdgeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMergeEdgeMode(Standard_Boolean value) {
            $self->MergeEdgeMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetMergeVertexMode() {
            return (Standard_Boolean) $self->MergeVertexMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMergeVertexMode(Standard_Boolean value) {
            $self->MergeVertexMode()=value;
            }
        };
		/****************** OperationType ******************/
		%feature("compactdefaultargs") OperationType;
		%feature("autodoc", "Returns ref.

	:rtype: BOPAlgo_Operation
") OperationType;
		BOPAlgo_Operation  OperationType();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs analysis.

	:rtype: None
") Perform;
		void Perform();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetRebuildFaceMode() {
            return (Standard_Boolean) $self->RebuildFaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetRebuildFaceMode(Standard_Boolean value) {
            $self->RebuildFaceMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetSelfInterMode() {
            return (Standard_Boolean) $self->SelfInterMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetSelfInterMode(Standard_Boolean value) {
            $self->SelfInterMode()=value;
            }
        };
		/****************** SetShape1 ******************/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "Sets object shape.

	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None
") SetShape1;
		void SetShape1(const TopoDS_Shape & TheShape);

		/****************** SetShape2 ******************/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "Sets tool shape.

	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None
") SetShape2;
		void SetShape2(const TopoDS_Shape & TheShape);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetSmallEdgeMode() {
            return (Standard_Boolean) $self->SmallEdgeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetSmallEdgeMode(Standard_Boolean value) {
            $self->SmallEdgeMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetStopOnFirstFaulty() {
            return (Standard_Boolean) $self->StopOnFirstFaulty();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetStopOnFirstFaulty(Standard_Boolean value) {
            $self->StopOnFirstFaulty()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetTangentMode() {
            return (Standard_Boolean) $self->TangentMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetTangentMode(Standard_Boolean value) {
            $self->TangentMode()=value;
            }
        };
};


/****************************
* class BOPAlgo_BuilderArea *
****************************/
%nodefaultctor BOPAlgo_BuilderArea;
%ignore BOPAlgo_BuilderArea::~BOPAlgo_BuilderArea();
class BOPAlgo_BuilderArea : public BOPAlgo_Algo {
	public:
		/****************** Areas ******************/
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "Returns the found areas.

	:rtype: TopTools_ListOfShape
") Areas;
		const TopTools_ListOfShape & Areas();

		/****************** IsAvoidInternalShapes ******************/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "Returns the avoidinternalshapes flag.

	:rtype: bool
") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes();

		/****************** Loops ******************/
		%feature("compactdefaultargs") Loops;
		%feature("autodoc", "Returns the found loops.

	:rtype: TopTools_ListOfShape
") Loops;
		const TopTools_ListOfShape & Loops();

		/****************** SetAvoidInternalShapes ******************/
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "Defines the preventing of addition of internal parts into result. the default value is false, i.e. the internal parts are added into result.

	:param theAvoidInternal:
	:type theAvoidInternal: bool
	:rtype: None
") SetAvoidInternalShapes;
		void SetAvoidInternalShapes(const Standard_Boolean theAvoidInternal);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets the context for the algorithms.

	:param theContext:
	:type theContext: IntTools_Context
	:rtype: None
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetShapes ******************/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "Sets the shapes for building areas.

	:param theLS:
	:type theLS: TopTools_ListOfShape
	:rtype: None
") SetShapes;
		void SetShapes(const TopTools_ListOfShape & theLS);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Returns the input shapes.

	:rtype: TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes();

};


/*****************************
* class BOPAlgo_BuilderShape *
*****************************/
%nodefaultctor BOPAlgo_BuilderShape;
class BOPAlgo_BuilderShape : public BOPAlgo_Algo {
	public:
		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape thes.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****************** HasDeleted ******************/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Returns true if any of the input shapes has been deleted during operation.

	:rtype: bool
") HasDeleted;
		Standard_Boolean HasDeleted();

		/****************** HasGenerated ******************/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Returns true if any of the input shapes has generated shapes during operation.

	:rtype: bool
") HasGenerated;
		Standard_Boolean HasGenerated();

		/****************** HasHistory ******************/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Returns flag of history availability.

	:rtype: bool
") HasHistory;
		Standard_Boolean HasHistory();

		/****************** HasModified ******************/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Returns true if any of the input shapes has been modified during operation.

	:rtype: bool
") HasModified;
		Standard_Boolean HasModified();

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "History tool.

	:rtype: opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> History();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if the shape thes has been deleted. in this case the shape will have no modified elements, but can have generated elements.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted(const TopoDS_Shape & theS);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape thes.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Modified;
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

		/****************** SetToFillHistory ******************/
		%feature("compactdefaultargs") SetToFillHistory;
		%feature("autodoc", "Allows disabling the history collection.

	:param theHistFlag:
	:type theHistFlag: bool
	:rtype: None
") SetToFillHistory;
		void SetToFillHistory(const Standard_Boolean theHistFlag);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the result of algorithm.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


/***************************
* class BOPAlgo_PaveFiller *
***************************/
class BOPAlgo_PaveFiller : public BOPAlgo_Algo {
	public:
		/****************** AddArgument ******************/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "Adds the argument for operation.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None
") AddArgument;
		void AddArgument(const TopoDS_Shape & theShape);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Returns the list of arguments.

	:rtype: TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** BOPAlgo_PaveFiller ******************/
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller();

		/****************** BOPAlgo_PaveFiller ******************/
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	:rtype: opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** DS ******************/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "	:rtype: BOPDS_DS
") DS;
		const BOPDS_DS & DS();

		/****************** Glue ******************/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "Returns the glue option of the algorithm.

	:rtype: BOPAlgo_GlueEnum
") Glue;
		BOPAlgo_GlueEnum Glue();

		/****************** IsAvoidBuildPCurve ******************/
		%feature("compactdefaultargs") IsAvoidBuildPCurve;
		%feature("autodoc", "Returns the flag to avoid building of p-curves of edges on faces.

	:rtype: bool
") IsAvoidBuildPCurve;
		Standard_Boolean IsAvoidBuildPCurve();

		/****************** NonDestructive ******************/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Returns the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated.

	:rtype: bool
") NonDestructive;
		Standard_Boolean NonDestructive();

		/****************** PDS ******************/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "	:rtype: BOPDS_PDS
") PDS;
		BOPDS_PDS PDS();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		virtual void Perform();

		/****************** SetArguments ******************/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "Sets the arguments for operation.

	:param theLS:
	:type theLS: TopTools_ListOfShape
	:rtype: None
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theLS);

		/****************** SetAvoidBuildPCurve ******************/
		%feature("compactdefaultargs") SetAvoidBuildPCurve;
		%feature("autodoc", "Sets the flag to avoid building of p-curves of edges on faces.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetAvoidBuildPCurve;
		void SetAvoidBuildPCurve(const Standard_Boolean theValue);

		/****************** SetGlue ******************/
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "Sets the glue option for the algorithm.

	:param theGlue:
	:type theGlue: BOPAlgo_GlueEnum
	:rtype: None
") SetGlue;
		void SetGlue(const BOPAlgo_GlueEnum theGlue);

		/****************** SetNonDestructive ******************/
		%feature("compactdefaultargs") SetNonDestructive;
		%feature("autodoc", "Sets the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated.

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetNonDestructive;
		void SetNonDestructive(const Standard_Boolean theFlag);

		/****************** SetSectionAttribute ******************/
		%feature("compactdefaultargs") SetSectionAttribute;
		%feature("autodoc", "	:param theSecAttr:
	:type theSecAttr: BOPAlgo_SectionAttribute
	:rtype: None
") SetSectionAttribute;
		void SetSectionAttribute(const BOPAlgo_SectionAttribute & theSecAttr);

};


/******************************
* class BOPAlgo_ShellSplitter *
******************************/
class BOPAlgo_ShellSplitter : public BOPAlgo_Algo {
	public:
		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "Adds a face <thes> to process.

	:param theS:
	:type theS: TopoDS_Shape
	:rtype: None
") AddStartElement;
		void AddStartElement(const TopoDS_Shape & theS);

		/****************** BOPAlgo_ShellSplitter ******************/
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter();

		/****************** BOPAlgo_ShellSplitter ******************/
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "Constructor.

	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the algorithm.

	:rtype: None
") Perform;
		virtual void Perform();

		/****************** Shells ******************/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "Returns the loops.

	:rtype: TopTools_ListOfShape
") Shells;
		const TopTools_ListOfShape & Shells();

		/****************** SplitBlock ******************/
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", "	:param theCB:
	:type theCB: BOPTools_ConnexityBlock
	:rtype: None
") SplitBlock;
		static void SplitBlock(BOPTools_ConnexityBlock & theCB);

		/****************** StartElements ******************/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "Return the faces to process.

	:rtype: TopTools_ListOfShape
") StartElements;
		const TopTools_ListOfShape & StartElements();

};


/*****************************
* class BOPAlgo_WireSplitter *
*****************************/
class BOPAlgo_WireSplitter : public BOPAlgo_Algo {
	public:
		/****************** BOPAlgo_WireSplitter ******************/
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter();

		/****************** BOPAlgo_WireSplitter ******************/
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the context.

	:rtype: opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** MakeWire ******************/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "	:param theLE:
	:type theLE: TopTools_ListOfShape
	:param theW:
	:type theW: TopoDS_Wire
	:rtype: None
") MakeWire;
		static void MakeWire(TopTools_ListOfShape & theLE, TopoDS_Wire & theW);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		virtual void Perform();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets the context for the algorithm.

	:param theContext:
	:type theContext: IntTools_Context
	:rtype: None
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetWES ******************/
		%feature("compactdefaultargs") SetWES;
		%feature("autodoc", "	:param theWES:
	:type theWES: BOPAlgo_WireEdgeSet
	:rtype: None
") SetWES;
		void SetWES(const BOPAlgo_WireEdgeSet & theWES);

		/****************** SplitBlock ******************/
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", "	:param theF:
	:type theF: TopoDS_Face
	:param theCB:
	:type theCB: BOPTools_ConnexityBlock
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: None
") SplitBlock;
		static void SplitBlock(const TopoDS_Face & theF, BOPTools_ConnexityBlock & theCB, const opencascade::handle<IntTools_Context> & theContext);

		/****************** WES ******************/
		%feature("compactdefaultargs") WES;
		%feature("autodoc", "	:rtype: BOPAlgo_WireEdgeSet
") WES;
		BOPAlgo_WireEdgeSet & WES();

};


/************************
* class BOPAlgo_Builder *
************************/
class BOPAlgo_Builder : public BOPAlgo_BuilderShape {
	public:
		/****************** AddArgument ******************/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "Adds the argument to the operation.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None
") AddArgument;
		virtual void AddArgument(const TopoDS_Shape & theShape);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Returns the list of arguments.

	:rtype: TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** BOPAlgo_Builder ******************/
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_Builder;
		 BOPAlgo_Builder();

		/****************** BOPAlgo_Builder ******************/
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_Builder;
		 BOPAlgo_Builder(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** BuildBOP ******************/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "Builds the result shape according to the given states for the objects and tools. these states can be unambiguously converted into the boolean operation type. thus, it performs the boolean operation on the given groups of shapes. //! the result is built basing on the result of builder operation (gf or any other). the only condition for the builder is that the splits of faces should be created and classified relatively solids. //! the method uses classification approach for choosing the faces which will participate in building the result shape: - all faces from each group having the given state for the opposite group will be taken into result. //! such approach shows better results (in comparison with bopalgo_buildersolid approach) when working with open solids. however, the result may not be always correct on such data (at least, not as expected) as the correct classification of the faces relatively open solids is not always possible and may vary depending on the chosen classification point on the face. //! history is not created for the solids in this method. //! to avoid pollution of the report of builder algorithm, there is a possibility to pass the different report to collect the alerts of the method only. but, if the new report is not given, the builder report will be used. so, even if builder passed without any errors, but some error has been stored into its report in this method, for the following calls the builder report must be cleared. //! the method may set the following errors: - bopalgo_alertbuilderfailed - building operation has not been performed yet or failed; - bopalgo_alertbopnotset - invalid bop type is given (common/fuse/cut/cut21 are supported); - bopalgo_alerttoofewarguments - arguments are not given; - bopalgo_alertunknownshape - the shape is unknown for the operation. //! parameters: @param theobjects - the group of objects for bop; @param theobjstate - state for objects faces to pass into result; @param thetools - the group of tools for bop; @param theobjstate - state for tools faces to pass into result; @param thereport - the alternative report to avoid pollution of the main one.

	:param theObjects:
	:type theObjects: TopTools_ListOfShape
	:param theObjState:
	:type theObjState: TopAbs_State
	:param theTools:
	:type theTools: TopTools_ListOfShape
	:param theToolsState:
	:type theToolsState: TopAbs_State
	:param theReport: default value is NULL
	:type theReport: Message_Report
	:rtype: None
") BuildBOP;
		virtual void BuildBOP(const TopTools_ListOfShape & theObjects, const TopAbs_State theObjState, const TopTools_ListOfShape & theTools, const TopAbs_State theToolsState, opencascade::handle<Message_Report > theReport = NULL);

		/****************** BuildBOP ******************/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "Builds the result of boolean operation of given type basing on the result of builder operation (gf or any other). //! the method converts the given type of operation into the states for the objects and tools required for their face to pass into result and performs the call to the same method, but with states instead of operation type. //! the conversion looks as follows: - common is built from the faces of objects located in any of the tools and vice versa. - fuse is built from the faces out of all given shapes; - cut is built from the faces of the objects out of the tools and faces of the tools located in solids of the objects. //! @param theobjects - the group of objects for bop; @param thetools - the group of tools for bop; @param theoperation - the bop type; @param thereport - the alternative report to avoid pollution of the global one.

	:param theObjects:
	:type theObjects: TopTools_ListOfShape
	:param theTools:
	:type theTools: TopTools_ListOfShape
	:param theOperation:
	:type theOperation: BOPAlgo_Operation
	:param theReport: default value is NULL
	:type theReport: Message_Report
	:rtype: None
") BuildBOP;
		void BuildBOP(const TopTools_ListOfShape & theObjects, const TopTools_ListOfShape & theTools, const BOPAlgo_Operation theOperation, opencascade::handle<Message_Report > theReport = NULL);

		/****************** CheckInverted ******************/
		%feature("compactdefaultargs") CheckInverted;
		%feature("autodoc", "Returns the flag defining whether the check for input solids on inverted status should be performed or not.

	:rtype: bool
") CheckInverted;
		Standard_Boolean CheckInverted();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the algorithm.

	:rtype: None
") Clear;
		virtual void Clear();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the context, tool for cashing heavy algorithms.

	:rtype: opencascade::handle<IntTools_Context>
") Context;
		opencascade::handle<IntTools_Context> Context();

		/****************** Glue ******************/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "Returns the glue option of the algorithm.

	:rtype: BOPAlgo_GlueEnum
") Glue;
		BOPAlgo_GlueEnum Glue();

		/****************** Images ******************/
		%feature("compactdefaultargs") Images;
		%feature("autodoc", "Returns the map of images.

	:rtype: TopTools_DataMapOfShapeListOfShape
") Images;
		const TopTools_DataMapOfShapeListOfShape & Images();

		/****************** NonDestructive ******************/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Returns the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated.

	:rtype: bool
") NonDestructive;
		Standard_Boolean NonDestructive();

		/****************** Origins ******************/
		%feature("compactdefaultargs") Origins;
		%feature("autodoc", "Returns the map of origins.

	:rtype: TopTools_DataMapOfShapeListOfShape
") Origins;
		const TopTools_DataMapOfShapeListOfShape & Origins();

		/****************** PDS ******************/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "Returns the data structure, holder of intersection information.

	:rtype: BOPDS_PDS
") PDS;
		BOPDS_PDS PDS();

		/****************** PPaveFiller ******************/
		%feature("compactdefaultargs") PPaveFiller;
		%feature("autodoc", "Returns the pavefiller, algorithm for sub-shapes intersection.

	:rtype: BOPAlgo_PPaveFiller
") PPaveFiller;
		BOPAlgo_PPaveFiller PPaveFiller();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation. the intersection will be performed also.

	:rtype: None
") Perform;
		virtual void Perform();

		/****************** PerformWithFiller ******************/
		%feature("compactdefaultargs") PerformWithFiller;
		%feature("autodoc", "Performs the operation with the prepared filler. the intersection will not be performed in this case.

	:param theFiller:
	:type theFiller: BOPAlgo_PaveFiller
	:rtype: None
") PerformWithFiller;
		virtual void PerformWithFiller(const BOPAlgo_PaveFiller & theFiller);

		/****************** SetArguments ******************/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "Sets the list of arguments for the operation.

	:param theLS:
	:type theLS: TopTools_ListOfShape
	:rtype: None
") SetArguments;
		virtual void SetArguments(const TopTools_ListOfShape & theLS);

		/****************** SetCheckInverted ******************/
		%feature("compactdefaultargs") SetCheckInverted;
		%feature("autodoc", "Enables/disables the check of the input solids for inverted status.

	:param theCheck:
	:type theCheck: bool
	:rtype: None
") SetCheckInverted;
		void SetCheckInverted(const Standard_Boolean theCheck);

		/****************** SetGlue ******************/
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "Sets the glue option for the algorithm.

	:param theGlue:
	:type theGlue: BOPAlgo_GlueEnum
	:rtype: None
") SetGlue;
		void SetGlue(const BOPAlgo_GlueEnum theGlue);

		/****************** SetNonDestructive ******************/
		%feature("compactdefaultargs") SetNonDestructive;
		%feature("autodoc", "Sets the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated. this flag is taken into account if internal pavefiller is used only. in the case of calling performwithfiller the corresponding flag of that pavefiller is in force.

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetNonDestructive;
		void SetNonDestructive(const Standard_Boolean theFlag);

		/****************** ShapesSD ******************/
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "Returns the map of same domain (sd) shapes - coinciding shapes from different arguments.

	:rtype: TopTools_DataMapOfShapeShape
") ShapesSD;
		const TopTools_DataMapOfShapeShape & ShapesSD();

};


/****************************
* class BOPAlgo_BuilderFace *
****************************/
class BOPAlgo_BuilderFace : public BOPAlgo_BuilderArea {
	public:
		/****************** BOPAlgo_BuilderFace ******************/
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace();

		/****************** BOPAlgo_BuilderFace ******************/
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face generatix.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the algorithm.

	:rtype: None
") Perform;
		virtual void Perform();

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "Sets the face generatix.

	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: None
") SetFace;
		void SetFace(const TopoDS_Face & theFace);

};


/*****************************
* class BOPAlgo_BuilderSolid *
*****************************/
class BOPAlgo_BuilderSolid : public BOPAlgo_BuilderArea {
	public:
		/****************** BOPAlgo_BuilderSolid ******************/
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid();

		/****************** BOPAlgo_BuilderSolid ******************/
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "Constructor with allocator.

	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** GetBoxesMap ******************/
		%feature("compactdefaultargs") GetBoxesMap;
		%feature("autodoc", "For classification purposes the algorithm builds the bounding boxes for all created solids. this method returns the data map of solid - box pairs.

	:rtype: TopTools_DataMapOfShapeBox
") GetBoxesMap;
		const TopTools_DataMapOfShapeBox & GetBoxesMap();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the construction of the solids from the given faces.

	:rtype: None
") Perform;
		virtual void Perform();

};


/**************************
* class BOPAlgo_CheckerSI *
**************************/
class BOPAlgo_CheckerSI : public BOPAlgo_PaveFiller {
	public:
		/****************** BOPAlgo_CheckerSI ******************/
		%feature("compactdefaultargs") BOPAlgo_CheckerSI;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_CheckerSI;
		 BOPAlgo_CheckerSI();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		virtual void Perform();

		/****************** SetLevelOfCheck ******************/
		%feature("compactdefaultargs") SetLevelOfCheck;
		%feature("autodoc", "Sets the level of checking shape on self-interference. it defines which interferences will be checked: 0 - only v/v; 1 - v/v and v/e; 2 - v/v, v/e and e/e; 3 - v/v, v/e, e/e and v/f; 4 - v/v, v/e, e/e, v/f and e/f; 5 - v/v, v/e, e/e, v/f, e/f and f/f; 6 - v/v, v/e, e/e, v/f, e/f, f/f and v/s; 7 - v/v, v/e, e/e, v/f, e/f, f/f, v/s and e/s; 8 - v/v, v/e, e/e, v/f, e/f, f/f, v/s, e/s and f/s; 9 - v/v, v/e, e/e, v/f, e/f, f/f, v/s, e/s, f/s and s/s - all interferences (default value).

	:param theLevel:
	:type theLevel: int
	:rtype: None
") SetLevelOfCheck;
		void SetLevelOfCheck(const Standard_Integer theLevel);

};


/*******************************
* class BOPAlgo_RemoveFeatures *
*******************************/
class BOPAlgo_RemoveFeatures : public BOPAlgo_BuilderShape {
	public:
		/****************** AddFaceToRemove ******************/
		%feature("compactdefaultargs") AddFaceToRemove;
		%feature("autodoc", "Adds the face to remove from the input shape. @param theface [in] the shape to extract the faces for removal.

	:param theFace:
	:type theFace: TopoDS_Shape
	:rtype: None
") AddFaceToRemove;
		void AddFaceToRemove(const TopoDS_Shape & theFace);

		/****************** AddFacesToRemove ******************/
		%feature("compactdefaultargs") AddFacesToRemove;
		%feature("autodoc", "Adds the faces to remove from the input shape. @param thefaces [in] the list of shapes to extract the faces for removal.

	:param theFaces:
	:type theFaces: TopTools_ListOfShape
	:rtype: None
") AddFacesToRemove;
		void AddFacesToRemove(const TopTools_ListOfShape & theFaces);

		/****************** BOPAlgo_RemoveFeatures ******************/
		%feature("compactdefaultargs") BOPAlgo_RemoveFeatures;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_RemoveFeatures;
		 BOPAlgo_RemoveFeatures();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the contents of the algorithm from previous run, allowing reusing it for following removals.

	:rtype: None
") Clear;
		virtual void Clear();

		/****************** FacesToRemove ******************/
		%feature("compactdefaultargs") FacesToRemove;
		%feature("autodoc", "Returns the list of faces which have been requested for removal from the input shape.

	:rtype: TopTools_ListOfShape
") FacesToRemove;
		const TopTools_ListOfShape & FacesToRemove();

		/****************** InputShape ******************/
		%feature("compactdefaultargs") InputShape;
		%feature("autodoc", "Returns the input shape.

	:rtype: TopoDS_Shape
") InputShape;
		const TopoDS_Shape InputShape();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation.

	:rtype: None
") Perform;
		virtual void Perform();

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets the shape for processing. @param theshape [in] the shape to remove the faces from.  it should either be the solid, compsolid or compound of solids.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

};


/*****************************
* class BOPAlgo_CellsBuilder *
*****************************/
class BOPAlgo_CellsBuilder : public BOPAlgo_Builder {
	public:
		/****************** AddAllToResult ******************/
		%feature("compactdefaultargs") AddAllToResult;
		%feature("autodoc", "Add all split parts to result. <thematerial> defines the removal of internal boundaries; <theupdate> parameter defines whether to remove boundaries now or not.

	:param theMaterial: default value is 0
	:type theMaterial: int
	:param theUpdate: default value is Standard_False
	:type theUpdate: bool
	:rtype: None
") AddAllToResult;
		void AddAllToResult(const Standard_Integer theMaterial = 0, const Standard_Boolean theUpdate = Standard_False);

		/****************** AddToResult ******************/
		%feature("compactdefaultargs") AddToResult;
		%feature("autodoc", "Adding the parts to result. the parts are defined by two lists of shapes: <thelstotake> defines the arguments which parts should be taken into result; <thelstoavoid> defines the arguments which parts should not be taken into result; to be taken into result the part must be in for all shapes from the list <thelstotake> and must be out of all shapes from the list <thelstoavoid>. to remove internal boundaries between any cells in the result <thematerial> variable should be used. the boundaries between cells with the same material will be removed. default value is 0. thus, to remove any boundary the value of this variable should not be equal to 0. <theupdate> parameter defines whether to remove boundaries now or not.

	:param theLSToTake:
	:type theLSToTake: TopTools_ListOfShape
	:param theLSToAvoid:
	:type theLSToAvoid: TopTools_ListOfShape
	:param theMaterial: default value is 0
	:type theMaterial: int
	:param theUpdate: default value is Standard_False
	:type theUpdate: bool
	:rtype: None
") AddToResult;
		void AddToResult(const TopTools_ListOfShape & theLSToTake, const TopTools_ListOfShape & theLSToAvoid, const Standard_Integer theMaterial = 0, const Standard_Boolean theUpdate = Standard_False);

		/****************** BOPAlgo_CellsBuilder ******************/
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder();

		/****************** BOPAlgo_CellsBuilder ******************/
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Redefined method clear - clears the contents.

	:rtype: None
") Clear;
		virtual void Clear();

		/****************** GetAllParts ******************/
		%feature("compactdefaultargs") GetAllParts;
		%feature("autodoc", "Get all split parts.

	:rtype: TopoDS_Shape
") GetAllParts;
		const TopoDS_Shape GetAllParts();

		/****************** MakeContainers ******************/
		%feature("compactdefaultargs") MakeContainers;
		%feature("autodoc", "Makes the containers of proper type from the parts added to result.

	:rtype: None
") MakeContainers;
		void MakeContainers();

		/****************** RemoveAllFromResult ******************/
		%feature("compactdefaultargs") RemoveAllFromResult;
		%feature("autodoc", "Remove all parts from result.

	:rtype: None
") RemoveAllFromResult;
		void RemoveAllFromResult();

		/****************** RemoveFromResult ******************/
		%feature("compactdefaultargs") RemoveFromResult;
		%feature("autodoc", "Removing the parts from result. the parts are defined by two lists of shapes: <thelstotake> defines the arguments which parts should be removed from result; <thelstoavoid> defines the arguments which parts should not be removed from result. to be removed from the result the part must be in for all shapes from the list <thelstotake> and must be out of all shapes from the list <thelstoavoid>.

	:param theLSToTake:
	:type theLSToTake: TopTools_ListOfShape
	:param theLSToAvoid:
	:type theLSToAvoid: TopTools_ListOfShape
	:rtype: None
") RemoveFromResult;
		void RemoveFromResult(const TopTools_ListOfShape & theLSToTake, const TopTools_ListOfShape & theLSToAvoid);

		/****************** RemoveInternalBoundaries ******************/
		%feature("compactdefaultargs") RemoveInternalBoundaries;
		%feature("autodoc", "Removes internal boundaries between cells with the same material. if the result contains the cells with same material but of different dimension the removal of internal boundaries between these cells will not be performed. in case of some errors during the removal the method will set the appropriate warning status - use getreport() to access them.

	:rtype: None
") RemoveInternalBoundaries;
		void RemoveInternalBoundaries();

};


/****************************
* class BOPAlgo_MakerVolume *
****************************/
class BOPAlgo_MakerVolume : public BOPAlgo_Builder {
	public:
		/****************** BOPAlgo_MakerVolume ******************/
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "Empty contructor.

	:rtype: None
") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume();

		/****************** BOPAlgo_MakerVolume ******************/
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "Empty contructor.

	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns the solid box <mysbox>.

	:rtype: TopoDS_Solid
") Box;
		const TopoDS_Solid Box();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the data.

	:rtype: None
") Clear;
		virtual void Clear();

		/****************** Faces ******************/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Returns the processed faces <myfaces>.

	:rtype: TopTools_ListOfShape
") Faces;
		const TopTools_ListOfShape & Faces();

		/****************** IsAvoidInternalShapes ******************/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "Returns the avoidinternalshapes flag.

	:rtype: bool
") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes();

		/****************** IsIntersect ******************/
		%feature("compactdefaultargs") IsIntersect;
		%feature("autodoc", "Returns the flag <myintersect>.

	:rtype: bool
") IsIntersect;
		Standard_Boolean IsIntersect();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation.

	:rtype: None
") Perform;
		virtual void Perform();

		/****************** SetAvoidInternalShapes ******************/
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "Defines the preventing of addition of internal for solid parts into the result. by default the internal parts are added into result.

	:param theAvoidInternal:
	:type theAvoidInternal: bool
	:rtype: None
") SetAvoidInternalShapes;
		void SetAvoidInternalShapes(const Standard_Boolean theAvoidInternal);

		/****************** SetIntersect ******************/
		%feature("compactdefaultargs") SetIntersect;
		%feature("autodoc", "Sets the flag myintersect: if <bintersect> is true the shapes from <myarguments> will be intersected. if <bintersect> is false no intersection will be done.

	:param bIntersect:
	:type bIntersect: bool
	:rtype: None
") SetIntersect;
		void SetIntersect(const Standard_Boolean bIntersect);

};


/************************
* class BOPAlgo_Section *
************************/
class BOPAlgo_Section : public BOPAlgo_Builder {
	public:
		/****************** BOPAlgo_Section ******************/
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_Section;
		 BOPAlgo_Section();

		/****************** BOPAlgo_Section ******************/
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "Constructor with allocator.

	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_Section;
		 BOPAlgo_Section(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

};


/******************************
* class BOPAlgo_ToolsProvider *
******************************/
class BOPAlgo_ToolsProvider : public BOPAlgo_Builder {
	public:
		/****************** AddTool ******************/
		%feature("compactdefaultargs") AddTool;
		%feature("autodoc", "Adds tool argument of the operation.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None
") AddTool;
		virtual void AddTool(const TopoDS_Shape & theShape);

		/****************** BOPAlgo_ToolsProvider ******************/
		%feature("compactdefaultargs") BOPAlgo_ToolsProvider;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_ToolsProvider;
		 BOPAlgo_ToolsProvider();

		/****************** BOPAlgo_ToolsProvider ******************/
		%feature("compactdefaultargs") BOPAlgo_ToolsProvider;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_ToolsProvider;
		 BOPAlgo_ToolsProvider(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal fields and arguments.

	:rtype: None
") Clear;
		virtual void Clear();

		/****************** SetTools ******************/
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "Adds the tool arguments of the operation.

	:param theShapes:
	:type theShapes: TopTools_ListOfShape
	:rtype: None
") SetTools;
		virtual void SetTools(const TopTools_ListOfShape & theShapes);

		/****************** Tools ******************/
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "Returns the tool arguments of the operation.

	:rtype: TopTools_ListOfShape
") Tools;
		const TopTools_ListOfShape & Tools();

};


/********************
* class BOPAlgo_BOP *
********************/
class BOPAlgo_BOP : public BOPAlgo_ToolsProvider {
	public:
		/****************** BOPAlgo_BOP ******************/
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_BOP;
		 BOPAlgo_BOP();

		/****************** BOPAlgo_BOP ******************/
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_BOP;
		 BOPAlgo_BOP(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal fields and arguments.

	:rtype: None
") Clear;
		virtual void Clear();

		/****************** Operation ******************/
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "	:rtype: BOPAlgo_Operation
") Operation;
		BOPAlgo_Operation Operation();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		virtual void Perform();

		/****************** SetOperation ******************/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "	:param theOperation:
	:type theOperation: BOPAlgo_Operation
	:rtype: None
") SetOperation;
		void SetOperation(const BOPAlgo_Operation theOperation);

};


/*************************
* class BOPAlgo_Splitter *
*************************/
class BOPAlgo_Splitter : public BOPAlgo_ToolsProvider {
	public:
		/****************** BOPAlgo_Splitter ******************/
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") BOPAlgo_Splitter;
		 BOPAlgo_Splitter();

		/****************** BOPAlgo_Splitter ******************/
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None
") BOPAlgo_Splitter;
		 BOPAlgo_Splitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation.

	:rtype: None
") Perform;
		virtual void Perform();

};


/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
