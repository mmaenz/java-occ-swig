/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class TopoDS_Wire extends TopoDS_Shape {
  private transient long swigCPtr;

  protected TopoDS_Wire(long cPtr, boolean cMemoryOwn) {
    super(TopoDSJNI.TopoDS_Wire_SWIGUpcast(cPtr), cMemoryOwn);
    swigCPtr = cPtr;
  }

  protected static long getCPtr(TopoDS_Wire obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        TopoDSJNI.delete_TopoDS_Wire(swigCPtr);
      }
      swigCPtr = 0;
    }
    super.delete();
  }

  public TopoDS_Wire() {
    this(TopoDSJNI.new_TopoDS_Wire(), true);
  }

}