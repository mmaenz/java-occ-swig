/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class TopoDS_Face extends TopoDS_Shape {
  private transient long swigCPtr;

  protected TopoDS_Face(long cPtr, boolean cMemoryOwn) {
    super(TopoDSJNI.TopoDS_Face_SWIGUpcast(cPtr), cMemoryOwn);
    swigCPtr = cPtr;
  }

  protected static long getCPtr(TopoDS_Face obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        TopoDSJNI.delete_TopoDS_Face(swigCPtr);
      }
      swigCPtr = 0;
    }
    super.delete();
  }

  public TopoDS_Face() {
    this(TopoDSJNI.new_TopoDS_Face(), true);
  }

}