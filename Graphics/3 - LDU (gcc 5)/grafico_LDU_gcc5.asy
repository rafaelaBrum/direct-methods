import plot;
import math;

    Graph gr;
    
    gr.set_style(PaperStyle);
 
    gr.plot("valores.con", 0, 1, "$ \textrm{Flag '-O3' with simple-precision} $");
    gr.plot("valores.con", 0, 2, "$ \textrm{Flag '-O3' with double-precision} $");
    gr.plot("valores.con", 0, 3, "$ \textrm{Flag '-Ofast' with simple-precision} $");
    gr.plot("valores.con", 0, 4, "$ \textrm{Flag '-Ofast' with double-precision} $");

    gr.xlabel("$ \textrm{Number of unknowns} $");
    gr.ylabel("$ \textrm{Average execution time (s)} $");
   
    gr.logscale(false, false);
//    gr.size(80mm, 70mm);
    
    gr.setymax( 7000.0);

    add(gr.finish());

    shipout("grafico_LDU_gcc5", "eps");

