/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class TopoDS_TSolid extends TopoDS_TShape {
  private transient long swigCPtr;

  protected TopoDS_TSolid(long cPtr, boolean cMemoryOwn) {
    super(TopoDSJNI.TopoDS_TSolid_SWIGUpcast(cPtr), cMemoryOwn);
    swigCPtr = cPtr;
  }

  protected static long getCPtr(TopoDS_TSolid obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        TopoDSJNI.delete_TopoDS_TSolid(swigCPtr);
      }
      swigCPtr = 0;
    }
    super.delete();
  }

  public SWIGTYPE_p_opencascade__handleT_TopoDS_TShape_t EmptyCopy() {
    return new SWIGTYPE_p_opencascade__handleT_TopoDS_TShape_t(TopoDSJNI.TopoDS_TSolid_EmptyCopy(swigCPtr, this), true);
  }

  public TopAbs_ShapeEnum ShapeType() {
    return TopAbs_ShapeEnum.swigToEnum(TopoDSJNI.TopoDS_TSolid_ShapeType(swigCPtr, this));
  }

  public TopoDS_TSolid() {
    this(TopoDSJNI.new_TopoDS_TSolid(), true);
  }

}