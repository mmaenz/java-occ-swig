/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class TopoDS_Builder {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected TopoDS_Builder(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(TopoDS_Builder obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        TopoDSJNI.delete_TopoDS_Builder(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void Add(TopoDS_Shape S, TopoDS_Shape C) {
    TopoDSJNI.TopoDS_Builder_Add(swigCPtr, this, TopoDS_Shape.getCPtr(S), S, TopoDS_Shape.getCPtr(C), C);
  }

  public void MakeCompSolid(TopoDS_CompSolid C) {
    TopoDSJNI.TopoDS_Builder_MakeCompSolid(swigCPtr, this, TopoDS_CompSolid.getCPtr(C), C);
  }

  public void MakeCompound(TopoDS_Compound C) {
    TopoDSJNI.TopoDS_Builder_MakeCompound(swigCPtr, this, TopoDS_Compound.getCPtr(C), C);
  }

  public void MakeShell(TopoDS_Shell S) {
    TopoDSJNI.TopoDS_Builder_MakeShell(swigCPtr, this, TopoDS_Shell.getCPtr(S), S);
  }

  public void MakeSolid(TopoDS_Solid S) {
    TopoDSJNI.TopoDS_Builder_MakeSolid(swigCPtr, this, TopoDS_Solid.getCPtr(S), S);
  }

  public void MakeWire(TopoDS_Wire W) {
    TopoDSJNI.TopoDS_Builder_MakeWire(swigCPtr, this, TopoDS_Wire.getCPtr(W), W);
  }

  public void Remove(TopoDS_Shape S, TopoDS_Shape C) {
    TopoDSJNI.TopoDS_Builder_Remove(swigCPtr, this, TopoDS_Shape.getCPtr(S), S, TopoDS_Shape.getCPtr(C), C);
  }

  public TopoDS_Builder() {
    this(TopoDSJNI.new_TopoDS_Builder(), true);
  }

}