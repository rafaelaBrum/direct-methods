import math;
frame nomark(pen p, real lw){
    frame fr;
    return fr;
}

int Auto =  0;
int Max =  1;
int Min =  2;
int Equal =  3;

string niceformat(string fmt, real x){
    string result = format(fmt, x);
    result = replace(result, ",", ".");
    return result;
}
string DefaultScientificFormat(real x){
    return niceformat("%.3e", x);
}
string DefaultLinearFormat(real x){
    return niceformat("%5.3f", x);
}
string DefaultLogFormat(real x){
    return niceformat("%5.3f", log10(x));
}
typedef string NumberFormat(real x);


pair normalize(pair z){
    real h = length(z);
    if(h>0) return z/h;
    else    return (0,0);
}
transform align(pair z1, pair z2, pair z3){
    //t = (t.x,t.y,t.xx,t.xy,t.yx,t.yy); 
    //x' = t.x + t.xx * x + t.xy * y
    //y' = t.y + t.yx * x + t.yy * y
    pair d1 = normalize(z1-z2);
    pair d2 = normalize(z3-z2);
    pair u = d1-d2;
    real h = length(u);
    if(h>0){
        u = u/length(u);
    } else {
        u = (1,0);
    }
    //u = (1,0);
    return (0.0, 0.0, u.x, -u.y, u.y, u.x); 
}

struct Triangle1{
    real rx;
    real ry;
    real dx;
    real dy;
    real size;
    bool draw = false;
}

struct Triangle2{
    real rx;
    real ry;
    real dx;
    real dy;
    real size;
    bool draw = false;
}

struct Graph{
    //**** Parâmetros configuráveis ****
    pair labels_position = (0,1); //posicao da legenda do grafico
    real box_margin = 3mm;
    pen box_pen = black;
    pen background_pen = invisible;
    
    pen tick_font;
    pen axis_font;
    
    real min_xTickStep = 8mm;
    real min_yTickStep = 8mm;
    real min_xtickstep = 2mm;
    real min_ytickstep = 2mm;
    real bigtick_size;
    pen bigtick_pen;
    real smalltick_size;
    pen smalltick_pen;
    
    pen gpen[] = {black};
    gpen.cyclic = true;
    frame gmark[] = {nomark(black,1)};
    gmark.cyclic =true;
    
    bool autoxticks = true;
    bool autoyticks = true;
    bool autoxTicks = true;
    bool autoyTicks = true;
    NumberFormat xTickFormat = DefaultLinearFormat;
    NumberFormat yTickFormat = DefaultScientificFormat;
    
    private Triangle1 tr1;
    private Triangle2 tr2;
    private real uxmin=infinity, uxmax=-infinity, uymin=infinity, uymax=-infinity;
    private real gxmin=infinity, gxmax=-infinity, gymin=infinity, gymax=-infinity;
    private real xmin=infinity, xmax=-infinity, ymin=infinity, ymax=-infinity;
    private int mxmin=Auto, mxmax=Auto, mymin=Auto, mymax=Auto;
    private real graphleft, graphbottom, graphright, graphtop;
    private real tw=120mm, th=80mm, gw, gh;
    private bool force_tw=true, force_th=true;
    private pair g[][];
    private string gL[];
    private bool xlog=false, ylog=false;
    private real xa, xb, xA, xB;
    private real ya, yb, yA, yB;
    private real xt[], xT[], yt[], yT[];
    private string xL[], yL[];
    private string xaL = "$x$", yaL = "$y$";
    private real margin;
    
    
    typedef void GraphStyle(Graph);
    void set_style(GraphStyle S){
        S(this);
    }
    
    private int validate_rangemode(int r){
        if( (r!=Auto) && (r!=Min) && (r!=Max) && (r!=Equal) ) return Auto;
        else return r;
    }
    
    void setxmin(real v, int mode=Equal){
        mxmin = validate_rangemode(mode);
        uxmin = v;
    }
    void setxmax(real v, int mode=Equal){
        mxmax = validate_rangemode(mode);
        uxmax = v;
    }
    void setymin(real v, int mode=Equal){
        mymin = validate_rangemode(mode);
        uymin = v;
    }
    void setymax(real v, int mode=Equal){
        mymax = validate_rangemode(mode);
        uymax = v;
    }
    
    void xlabel(string s){
        xaL = s;
    }
    void ylabel(string s){
        yaL = s;
    }
    
    private void makescale(){
        if(xlog){
            xa = (-graphleft + graphright - 2*margin)/(log10(xmax) - log10(xmin));
            xb = ((graphleft + margin)*log10(xmax) + (-graphright + margin)*log10(xmin))/(log10(xmax) - log10(xmin));
            xA = (-log10(xmax) + log10(xmin))/(graphleft - graphright + 2*margin);
            xB = ((graphleft + margin)*log10(xmax) + (-graphright + margin)*log10(xmin))/(graphleft - graphright + 2*margin);
        } else {
            xa = (-graphleft + graphright - 2*margin)/(xmax - xmin);
            xb = (graphleft*xmax - graphright*xmin + margin*(xmax + xmin))/(xmax - xmin);
            xA = (-xmax + xmin)/(graphleft - graphright + 2*margin);
            xB = (graphleft*xmax - graphright*xmin + margin*(xmax + xmin))/(graphleft - graphright + 2*margin);
        }
        if(ylog){
            ya = (-graphbottom + graphtop - 2*margin)/(log10(ymax) - log10(ymin));
            yb = ((graphbottom + margin)*log10(ymax) + (-graphtop + margin)*log10(ymin))/(log10(ymax) - log10(ymin));
            yA = (-log10(ymax) + log10(ymin))/(graphbottom - graphtop + 2*margin);
            yB = ((graphbottom + margin)*log10(ymax) + (-graphtop + margin)*log10(ymin))/(graphbottom - graphtop + 2*margin);
        } else {
            ya = (-graphbottom + graphtop - 2*margin)/(ymax - ymin);
            yb = (graphbottom*ymax - graphtop*ymin + margin*(ymax + ymin))/(ymax - ymin);
            yA = (-ymax + ymin)/(graphbottom - graphtop + 2*margin);
            yB = (graphbottom*ymax - graphtop*ymin + margin*(ymax + ymin))/(graphbottom - graphtop + 2*margin);
        }
    }
    private real adjustrange(int mode, real gvalue, real uvalue){
        if(mode==Auto){
            return gvalue;
        } else if (mode==Max) {
            return (gvalue < uvalue) ? gvalue : uvalue;
        } else if (mode==Min) {
            return (gvalue > uvalue) ? gvalue : uvalue;
        } else if (mode==Equal) {
            return uvalue;
        } else {
            return 1;
        }
    }
    private void adjustrange(){
        xmin = adjustrange(mxmin, gxmin, uxmin);
        ymin = adjustrange(mymin, gymin, uymin);
        xmax = adjustrange(mxmax, gxmax, uxmax);
        ymax = adjustrange(mymax, gymax, uymax);
        if(xlog){
            if(xmin>xmax){
                xmin = 1;
                xmax = 10;
            }
        } else {
            if(xmin>xmax){
                xmin = 0;
                xmax = 1;
            }
        }
        if(ylog){
            if(ymin>ymax){
                ymin = 1;
                ymax = 10;
            }
        } else {
            if(ymin>ymax){
                ymin = 0;
                ymax = 1;
            }
        }
    }
    
    //(xmin, xmax) -> (graphleft+margin, graphright-margin)
    //(ymin, ymax) -> (graphbottom+margin, graphtop-margin)
    public real xPS(real x){
        if(xlog){
            return xa * log10(x) + xb;
        } else {
            return xa * x + xb;
        }
    }
    public real yPS(real y){
        if(ylog){
            return ya * log10(y) + yb;
        } else {
            return ya * y + yb;
        }
    }
    public pair toPS(pair z){
        return (xPS(z.x), yPS(z.y));
    }
    
    //(graphleft+margin, graphright-margin) -> (xmin, xmax)
    //(graphbottom+margin, graphtop-margin) -> (ymin, ymax)
    public real xGR(real X){
        if(xlog){
            return pow10(xA * X + xB);
        } else {
            return xA * X + xB;
        }
    }
    public real yGR(real Y){
        if(ylog){
            return pow10(yA * Y + yB);
        } else {
            return yA * Y + yB;
        }
    }
    public pair toGR(pair z){
        return (xGR(z.x), yGR(z.y));
    }
    
    void logscale(bool XLog, bool YLog){
         xlog = XLog;
         ylog = YLog;
    }
    
    static real iden(real x){return x;};
    
    void plot(real x[], real y[], real fx(real) = iden, real fy(real) = iden, string lab = ""){
        int n = min(x.length, y.length);
        int top = g.length;
        g.push(new pair[]);
        
        for(int i=0; i<n; ++i){
            real X, Y;
            X = fx(x[i]);
            Y = fy(y[i]);
            if(X < gxmin) gxmin = X;
            if(X > gxmax) gxmax = X;
            
            if(Y < gymin) gymin = Y;
            if(Y > gymax) gymax = Y;
            g[top].push((X, Y));
        }
        gL.push(lab);
    };
    void plot(string filename, int colx, int coly, real fx(real) = iden, real fy(real) = iden, string lab = ""){
        file in = input(filename, false);
        if(error(in)) return;
        in = in.line();
        real[][] a = in.dimension(0, 0);
        a=transpose(a);
        
        real[] x = a[colx];
        real[] y = a[coly];
        
        plot(x, y, fx, fy, lab);
    }
    void plot(real fx(real), real fy(real), real a, real b, int n, string lab = ""){
        if(n<0) return;
        int top = g.length;
        g.push(new pair[]);
        if(n<=0) return;
        real t, x, y;
        for(int i=0; i<=n; ++i){
            t = a + (b-a)*i/n;
            x = fx(t);
            y = fy(t);
            if(x < gxmin) gxmin = x;
            if(x > gxmax) gxmax = x;
            
            if(y < gymin) gymin = y;
            if(y > gymax) gymax = y;
            g[top].push((x, y));
        }
        gL.push(lab);
    }
    
    void plot(real f(real), real a, real b, int n, string lab = ""){
        plot(iden, f, a, b, n, lab);
    }

    //Ticks and ticks
    
    private real pow(real x, real y){
        return exp(y*log(x));
    }
    private real[] maketicks(int n, real a, real b, bool include_first, bool include_last, bool L){
        real t[];
        real v;
        int first = include_first ? 0 : 1;
        int last = include_last ? n : n-1;
        if(L){
            for(int i=first; i<=last; ++i){
                t.push(a*pow(b/a,i/n));
            }
        } else {
            for(int i=first; i<=last; ++i){
                t.push(a+(b-a)*i/n);
            }
        }
        return t;
    }
    
    void xtick(real x)  { xt.push(x); }
    void ytick(real y)  { yt.push(y); }
    
    void xTick(real x, string L)  { xT.push(x);xL.push(L); }
    void yTick(real y, string L)  { yT.push(y);yL.push(L); }
    
    void xticks(real []x, bool limit = false){
        for(int i=0; i<x.length; ++i){
            if((!limit) || ((x[i] < xmax) && (x[i] > xmin)))
                xtick(x[i]);
        }
    }
    void yticks(real []y, bool limit = false){
        for(int i=0; i<y.length; ++i){
            if((!limit) || ((y[i] < ymax) && (y[i] > ymin)))
                ytick(y[i]);
        }
    }
    void xticks(real a, real b, int n){
        xticks(maketicks(n, a, b, true, true, xlog));
    }
    void yticks(real a, real b, int n){
        yticks(maketicks(n, a, b, true, true, xlog));
    }
    
    void xTicks(real []x, string L[])  { for(int i=0; i<x.length; ++i){ xTick(x[i], L[i]); } }
    void yTicks(real []y, string L[])  { for(int i=0; i<y.length; ++i){ yTick(y[i], L[i]); } }
    
    void xTicks(real []x, string fmt(real))  {for(int i=0; i<x.length; ++i){ xTick(x[i], fmt(x[i])); }}
    void yTicks(real []y, string fmt(real))  {for(int i=0; i<y.length; ++i){ yTick(y[i], fmt(y[i])); }}
    
    public static string log10fmt(real x){
        return format("%f", log10(x));
    }
    public static string pow10fmt(real x){
        return format("$10^{%f}$", log10(x));
    }
    void logxTicks(string fmt(real) = log10fmt, bool smalltoo = true, bool smalllog = false){
        autoxticks = false;
        autoxTicks = false;
        adjustrange();
        real a, b;
        int n;
        a = pow10(ceil(log10(xmin)));
        b = pow10(floor(log10(xmax)));
        n = round(log10(b/a));
        xTicks(maketicks(n, a, b, true, true, true), fmt);
        if(smalltoo){
            for(real x=a/10.0; x<b*10.0; x=x*10.0){
                xticks(maketicks(10, x, 10*x, false, false, smalllog), true);
            }
        }
    }
    void logyTicks(string fmt(real) = log10fmt, bool smalltoo = true, bool smalllog = false){
        autoyticks = false;
        autoyTicks = false;
        adjustrange();
        real a, b;
        int n;
        a = pow10(ceil(log10(ymin)));
        b = pow10(floor(log10(ymax)));
        n = round(log10(b/a));
        if(n==0){
            a = pow10(floor(log10(ymin)));
            b = pow10(ceil(log10(ymax)));
            setymin(a, Max);
            setymax(b, Min);
            n = round(log10(b/a));
            adjustrange();
        }
        yTicks(maketicks(n, a, b, true, true, true), fmt);
        if(smalltoo){
            for(real y=a/10.0; y<b*10.0; y=y*10.0){
                yticks(maketicks(10, y, 10*y, false, false, smalllog), true);
            }
        }
    }
    private static string nofmt(real x){return "";}
    static string linearfmt(real x){
        return format("%f", x);
    }
    void samplexTicks(int l, int n, string fmt(real) = nofmt){
        int N = g[l].length;
        real a;
        int j;
        if(fmt == nofmt){
            if(xlog) fmt = log10fmt;
            else fmt = linearfmt;
        }
        for(int i=0; i<=n; ++i){
            a = i/n;
            a = a*(N-1.0);
            j = round(a);
            xTick(g[l][j].x, fmt(g[l][j].x));
        }
    }
    private frame xTick(string L, pair position){
        frame result;
        label(result, Label(L), position = position, align = S, tick_font);
        return result;
    }
    private frame yTick(string L, pair position){
        frame result;
        real a = 0;
        label(result, rotate(a)*Label(L, position = position, align = (Cos(a+180), Sin(a+180)), tick_font));
        return result;
    }
    void xTicks(real a, real b, int n, string fmt(real) = xTickFormat){
        xTicks(maketicks(n, a, b, true, true, xlog), fmt);
    }
    void yTicks(real a, real b, int n, string fmt(real) = yTickFormat){
        yTicks(maketicks(n, a, b, true, true, xlog), fmt);
    }
   
    
    public void size(real totalwidth = 0, real totalheight = 0, real graphwidth = 0, real graphheight = 0){
        force_tw = (totalwidth > 0) || (graphwidth <= 0);
        if(force_tw){
            tw = (totalwidth > 0) ? totalwidth : 120mm;
        } else {
            gw = graphwidth;
        }
        force_th = (totalheight > 0) || (graphheight <= 0);
        if(force_th){
            th = (totalheight > 0) ? totalheight : 80mm;
        } else {
            gh = graphheight;
        }
    }
    
    frame graphlabels(){
        frame f;
        real y=0, dy, samplelength;
        samplelength = 0.7cm;
        dy = lineskip(axis_font);
        for(int i=0; i<g.length; ++i){
            if(gL[i] != ""){
                draw(f, (0,y)--(samplelength,y),gpen[i]);
                add(f, shift(0.5((0,y)+(samplelength,y)))*gmark[i]);
                label(f, gL[i], (samplelength+2pt,y), E, axis_font);
                y = y-dy;
            }
        }
        return f;
    }
    
    private void autoticks(real A, real B, real H, real a, real b, real T[], real t[], bool smalltoo, bool L){
        if(L){
            a = log10(a);
            b = log10(b);
        }        
        real h = H*(b-a)/(B-A);
        real mag = pow10(floor(log10(h)));
        real r = mag/h;
        if(r > 1.0){
            h = mag;
        } else if(r > 0.5) {
            h = 2*mag;
        } else if(r > 0.2) {
            h = 5.0*mag;
        } else {
            h = 10.0*mag;
        }
        real first = ceil((a-h/10)/h)*h;
        real last = floor((b+h/10)/h)*h;
        int n = round((last-first)/h);
        for(int i=0; i<=n; ++i){
            if(L) T.push(pow10(first + i*h));
            else T.push(first + i*h);
        }
        if(smalltoo){
            if(r > 1.0){
                h = h/2;
            } else if(r > 0.5) {
                h = h/4;
            } else if(r > 0.2) {
                h = h/10;
            } else {
                h = h/10;
            }
            for(r=first-10*h; r<=last+10*h; r = r+h){
                if(L) t.push(pow10(r));
                else t.push(r);
            }
        }
    }
    
    void triangle1(real dx, real dy, real rx, real ry, real size){
        tr1.rx = rx;
        tr1.ry = ry;
        tr1.dx = dx;
        tr1.dy = dy;
        tr1.size = size;
        tr1.draw = true;
    }
    void triangle2(real dx, real dy, real rx, real ry, real size){
        tr2.rx = rx;
        tr2.ry = ry;
        tr2.dx = dx;
        tr2.dy = dy;
        tr2.size = size;
        tr2.draw = true;
    }

    frame finish(){
        frame result;
        margin =box_margin;
        
        adjustrange();
        
        //Calcular a altura do rótulo do eixo x
        real xah, yaw;
        {
            frame f;
            draw(f, (0,0)--(0,0), invisible);
            label(f, xaL, align = S, axis_font);
            xah = max(f).y-min(f).y;
        }
        
        //Calcular a largura do rótulo do eixo y
        {            
            frame f;
            draw(f, (0,0)--(0,0), invisible);
            label(f, rotate(90)*Label(yaL), align = W, axis_font);
            yaw = max(f).x-min(f).x;
            
        }
        
        real xth = 0;
        real ytw = 0;
        bool firststep = true;
        void refit(bool laststep = false){
            //Calcular a altura dos rótulos das marcas no eixo x
            for(int i=0; i<xL.length; ++i){
                real h;
                frame f = xTick(xL[i], (0, 0));
                h = -min(f).y;
                if(h>xth) xth = h;
            }
            
            if(autoxTicks && (! firststep) ){
                real X[];
                real x[];
                if(xlog){
                    xTickFormat = DefaultLogFormat;
                } else {
                    xTickFormat = DefaultLinearFormat;
                }
                autoticks(xPS(xmin), xPS(xmax), min_xTickStep, xmin, xmax, X, x, laststep && autoxticks, xlog);
                for(int i=0; i<X.length; ++i){
                    real h;
                    frame f = xTick(xTickFormat(X[i]), (0, 0));
                    h = -min(f).y;
                    if(h>xth) xth = h;
                    
                    if(laststep) xTick(X[i], xTickFormat(X[i]));
                }
                xticks(x, true);
            }
            
            //Calcular a largura dos rótulos das marcas no eixo y
            for(int i=0; i<yL.length; ++i){
                real w;
                frame f = yTick(yL[i], (0, 0));
                w = -min(f).x;
                if(w>ytw) ytw = w;
            }
            
            if(autoyTicks && (! firststep) ){
                real Y[];
                real y[];
                if(ylog){
                    yTickFormat = DefaultLogFormat;
                } else {
                    yTickFormat = DefaultScientificFormat;
                }
                autoticks(yPS(ymin), yPS(ymax), min_yTickStep, ymin, ymax, Y, y, laststep && autoyticks, ylog);
                for(int i=0; i<Y.length; ++i){
                    real w;
                    frame f = yTick(yTickFormat(Y[i]), (0, 0));
                    w = -min(f).x;
                    if(w>ytw) ytw = w;
                    
                    if(laststep) yTick(Y[i], yTickFormat(Y[i]));
                }
                yticks(y, true);
            }
            
            //Calcular as dimensões da área do gráfico
            if(force_tw){
                gw = tw-ytw-yaw-0.5*linewidth(box_pen);
            } else {
                tw = gw+ytw+yaw+0.5*linewidth(box_pen);
            }
            if(force_th){
                gh = th-xth-xah-0.5*linewidth(box_pen);
            } else {
                th = gh+xth+xah+0.5*linewidth(box_pen);
            }
            
            graphleft = 0;
            graphright = graphleft + gw;
            graphbottom = 0;
            graphtop = graphbottom + gh;
            
            //Calcular as escalas
            makescale();
            firststep = false;
        }
        refit();
        if(autoxTicks || autoyTicks){
            refit();
            refit();
            refit();
            refit(true);
        }
        
        
        
        //Plotar os gráficos
        frame gr;
        pair z1 = (graphleft, graphbottom);
        pair z2 = (graphright, graphbottom);
        pair z3 = (graphright, graphtop);
        pair z4 = (graphleft, graphtop);
        real m =box_margin;
        z1 = z1 + 0.5(+m,+m);
        z2 = z2 + 0.5(-m,+m);
        z3 = z3 + 0.5(-m,-m);
        z4 = z4 + 0.5(+m,-m);
        
        for(int i=0; i<g.length; ++i){
            guide graph;
            for(int j=0; j<g[i].length; ++j){
                graph = graph--(toPS(g[i][j]));
            }
            draw(gr, graph,gpen[i]);
            for(int j=0; j<g[i].length; ++j){
                int p1 = j>0 ? j-1 : 0;
                int p2 = j;
                int p3 = j<(g[i].length-1) ? j+1 : g[i].length-1;
                add(gr, align(toPS(g[i][p1]),toPS(g[i][p2]),toPS(g[i][p3]))*gmark[i], position=toPS(g[i][j]));
            }
            
        }
        clip(gr, z1--z2--z3--z4--cycle);
        add(result, gr);
        
        //Desenhar as marcas e os rótulos do eixo x
        for(int i=0; i<xt.length; ++i){
            draw(result, (xPS(xt[i]), graphbottom)--(xPS(xt[i]), graphbottom+smalltick_size),smalltick_pen);
            //draw(result, (xPS(xt[i]), graphtop)--(xPS(xt[i]), graphtop-smalltick_size),smalltick_pen);
        }
        for(int i=0; i<xT.length; ++i){
            draw(result, (xPS(xT[i]), graphbottom)--(xPS(xT[i]), graphbottom+bigtick_size),bigtick_pen);
            //draw(result, (xPS(xT[i]), graphtop)--(xPS(xT[i]), graphtop-bigtick_size),bigtick_pen);
            add(result, xTick(xL[i], (xPS(xT[i]), graphbottom)));
        }
        label(result, xaL, position = (0.5*(graphleft+graphright), graphbottom-xth), align = S, axis_font);
        
        //Desenhar as marcas e os rótulos do eixo y
        for(int i=0; i<yt.length; ++i){
            draw(result, (graphleft, yPS(yt[i]))--(graphleft+smalltick_size, yPS(yt[i])),smalltick_pen);
            //draw(result, (graphright, yPS(yt[i]))--(graphright-smalltick_size, yPS(yt[i])),smalltick_pen);
        }
        for(int i=0; i<yT.length; ++i){
            draw(result, (graphleft, yPS(yT[i]))--(graphleft+bigtick_size, yPS(yT[i])),bigtick_pen);
            //draw(result, (graphright, yPS(yT[i]))--(graphright-bigtick_size, yPS(yT[i])),bigtick_pen);
            add(result, yTick(yL[i], (graphleft, yPS(yT[i]))));
        }
        label(result, rotate(90)*Label(yaL), position = (graphleft-ytw, 0.5*(graphbottom+graphtop)), align = W, axis_font);
        
        
        pair z1 = (graphleft, graphbottom);
        pair z2 = (graphright, graphbottom);
        pair z3 = (graphright, graphtop);
        pair z4 = (graphleft, graphtop);
        draw(result, z1--z2--z3--z4--cycle,box_pen);
        
        frame labels = graphlabels();
        labels = shift(-min(labels))*labels;
        real sx, sy;
        if((labels_position.x>=0) && (labels_position.x<=1)){
            sx = graphleft + margin + (graphright-graphleft-2*margin - (max(labels)-min(labels)).x)*labels_position.x;
        } else if((labels_position.x>1)){
            sx = graphright + margin + (graphright-graphleft)*(labels_position.x-1);
        } else {
            sx = 0;
        }
         
        if((labels_position.y>=0) && (labels_position.y<=1)){
            sy = graphbottom + margin + (graphtop-graphbottom-2*margin - (max(labels)-min(labels)).y)*labels_position.y;
        } else if((labels_position.y>1)){
            sy = graphtop + margin + (graphtop-graphbottom)*(labels_position.y-1);
        } else {
            sy = 0;
        }
        add(result, shift(sx, sy)*labels);
        
        if(tr1.draw){
            frame gtr;
            pair z0 = (graphleft+gw*tr1.rx, graphbottom+gh*tr1.ry);
            pair g0 = toGR(z0);
            
            real a;
            if(xlog) a = xPS(g0.x * pow10(tr1.dx)) - z0.x;
            else     a = xPS(g0.x + tr1.dx) - z0.x;
            
            real b;
            if(ylog) b = yPS(g0.y * pow10(tr1.dy)) - z0.y;
            else     b = yPS(g0.y + tr1.dy) - z0.y;
            
            real m = abs(a)>abs(b) ? abs(a) : abs(b);
            a = a/m*tr1.size;
            b = b/m*tr1.size;
            
            z0 = z0-(a,b)*0.5;
            
            draw(gtr, z0--(z0+(a,0))--(z0+(0,b))--cycle);
            label(gtr, format("%f", tr1.dx), position = (z0+(0.5a,0)), align = S, tick_font);
            label(gtr, format("%f", tr1.dy), position = (z0+(0,0.5b)), align = W, tick_font);
            add(result, gtr);
        }
        if(tr2.draw){
            frame gtr;
            pair z0 = (graphleft+gw*tr2.rx, graphbottom+gh*tr2.ry);
            pair g0 = toGR(z0);
            
            real a;
            if(xlog) a = xPS(g0.x * pow10(tr2.dx)) - z0.x;
            else     a = xPS(g0.x + tr2.dx) - z0.x;
            
            real b;
            if(ylog) b = yPS(g0.y * pow10(tr2.dy)) - z0.y;
            else     b = yPS(g0.y + tr2.dy) - z0.y;
            
            real m = abs(a)>abs(b) ? abs(a) : abs(b);
            a = a/m*tr2.size;
            b = b/m*tr2.size;
            
            z0 = z0-(a,b)*0.5;
            
            draw(gtr, z0--(z0+(a,0))--(z0+(0,b))--cycle);
            label(gtr, format("%f", tr2.dx), position = (z0+(0.5a,0)), align = S, tick_font);
            label(gtr, format("%f", tr2.dy), position = (z0+(0,0.5b)), align = W, tick_font);
            add(result, gtr);
        }

        
        frame background;
        real m =box_margin;
        z1 = z1 + (+m,+m);
        z2 = z2 + (-m,+m);
        z3 = z3 + (-m,-m);
        z4 = z4 + (+m,-m);
        fill(background, z1--z2--z3--z4--cycle,background_pen);
        prepend(result, background);
        
        return result;
    }

}


//Marks
frame circlemark(pen p, real lw){
    frame fr;
    filldraw(fr, scale(1.6lw)*unitcircle, white, p);
    return fr;
}
frame dotmark(pen p, real lw){
    frame fr;
    filldraw(fr, scale(1.6lw)*unitcircle, p, p);
    return fr;
}
frame squaremark(pen p, real lw){
    frame fr;
    filldraw(fr, scale(3.2lw)*shift((-0.5,-0.5))*unitsquare, white, p);
    return fr;
}
frame diamondmark(pen p, real lw){
    frame fr;
    filldraw(fr, scale(2.3lw,4.0lw)*rotate(45)*shift((-0.5,-0.5))*unitsquare, white, p);
    return fr;
}
frame crossmark(pen p, real lw){
    frame fr;
    pair p1=(-1, -1);
    pair p2=(1, 1);
    pair p3=(-1, 1);
    pair p4=(1, -1);
    draw(fr, scale(2*lw)*(p1--p2), p);
    draw(fr, scale(2*lw)*(p3--p4), p);
    return fr;
}     


//PaperStyle
void PaperStyle(Graph gr){
    //defaultpen(fontsize(11pt));
    gr.box_margin = 3.0mm;
    gr.box_pen = black + 0.15mm;
    gr.background_pen = invisible;
    gr.tick_font = fontsize(11pt);
    gr.axis_font = fontsize(12pt);
    
    gr.bigtick_size = 2mm;
    gr.bigtick_pen = squarecap + black + 0.15mm;
    gr.smalltick_size = 1mm;
    gr.smalltick_pen = squarecap + black + 0.1mm;
    
    gr.gpen = new pen[] {
        /*heavyred+squarecap+0.4mm,
        heavygreen+squarecap+0.4mm,
        heavyblue+squarecap+0.4mm,
        heavycyan+squarecap+0.4mm,
        heavymagenta+squarecap+0.4mm,
        olive+squarecap+0.4mm*/
        gray+squarecap+0.5mm,
        gray+squarecap+linetype("1 4 4 4",true)+0.5mm,
        black+squarecap+linetype("4 4",true)+0.5mm,
       	black+squarecap+0.5mm,
        black+squarecap+linetype("4 4",true)+0.5mm
        
    };
    gr.gpen.cyclic =true;
    gr.gmark = new frame[] {
        crossmark(gr.gpen[0], linewidth(gr.gpen[0])),
        squaremark(gr.gpen[1], linewidth(gr.gpen[1])),
        dotmark(gr.gpen[2], linewidth(gr.gpen[2])),
        circlemark(gr.gpen[3]+0.25mm, linewidth(gr.gpen[3])),
        diamondmark(gr.gpen[4], linewidth(gr.gpen[4]))
    };
    gr.gmark.cyclic =true;
}

void PaperStyleNoMarks(Graph gr){
    //defaultpen(fontsize(11pt));
    gr.box_margin = 3.0mm;
    gr.box_pen = black + 0.15mm;
    gr.background_pen = invisible;
    gr.tick_font = fontsize(9pt);
    gr.axis_font = fontsize(10pt);
    
    gr.bigtick_size = 2mm;
    gr.bigtick_pen = squarecap + black + 0.15mm;
    gr.smalltick_size = 1mm;
    gr.smalltick_pen = squarecap + black + 0.1mm;
    
    gr.gpen = new pen[] {
        red+squarecap+0.3mm,
        blue+squarecap+linetype("4 4",true)+0.3mm,
        heavygreen+squarecap+linetype("1 3",true)+0.3mm,
        magenta+squarecap+linetype("1 4 4 4",true)+0.3mm,
        black+squarecap+linetype("4 4",true)+0.3mm
    };
    gr.gpen.cyclic =true;
    gr.gmark = new frame[] {
        nomark(gr.gpen[0], linewidth(gr.gpen[0])),
    };
    gr.gmark.cyclic =true;
}

//ColorStyle
void ColorStyle(Graph gr){
    gr.box_margin = 3.0mm;
    gr.box_pen = black + 0.15mm;
    gr.background_pen = invisible;
    gr.tick_font = fontsize(9);
    gr.axis_font = fontsize(11);
    
    gr.bigtick_size = 2mm;
    gr.bigtick_pen = squarecap + black + 0.15mm;
    gr.smalltick_size = 1mm;
    gr.smalltick_pen = squarecap + black + 0.1mm;
    
    gr.gpen = new pen[] {
        red+squarecap+0.3mm,
        blue+squarecap+0.3mm,
        heavygreen+squarecap+0.3mm,
        magenta+squarecap+0.3mm,
        heavycyan+squarecap+0.3mm
    };
    gr.gpen.cyclic =true;
    gr.gmark = new frame[] {
        diamondmark(gr.gpen[0], linewidth(gr.gpen[0])),
        dotmark(gr.gpen[1], linewidth(gr.gpen[1])),
        squaremark(gr.gpen[2], linewidth(gr.gpen[2])),
        circlemark(gr.gpen[3], linewidth(gr.gpen[3])),
        dotmark(gr.gpen[4], linewidth(gr.gpen[4]))
    };
    gr.gmark.cyclic =true;
}


//ThesysStyle
void ThesysStyle(Graph gr){
    gr.box_margin = 3.0mm;
    gr.box_pen = black + 0.15mm;
    gr.background_pen = invisible;
    gr.tick_font = fontsize(9pt);
    gr.axis_font = fontsize(10pt);
    
    gr.bigtick_size = 2mm;
    gr.bigtick_pen = squarecap + black + 0.15mm;
    gr.smalltick_size = 1mm;
    gr.smalltick_pen = squarecap + black + 0.1mm;
    
    gr.gpen = new pen[] {
        red+squarecap+0.3mm,
        blue+squarecap+0.3mm,
        heavygreen+squarecap+0.3mm,
        magenta+squarecap+0.3mm,
        heavycyan+squarecap+0.3mm,
        olive+squarecap+0.3mm
        /*black+squarecap+0.3mm,
        black+squarecap+linetype("1 4 4 4",true)+0.3mm,
        black+squarecap+linetype("4 4",true)+0.3mm,
        black+squarecap+linetype("1 3",true)+0.3mm,
        black+squarecap+linetype("4 4",true)+0.3mm
        */
    };
    gr.gpen.cyclic =true;
    gr.gmark = new frame[] {
        crossmark(gr.gpen[0], linewidth(gr.gpen[0])),
        dotmark(gr.gpen[1], linewidth(gr.gpen[1])),
        squaremark(gr.gpen[2], linewidth(gr.gpen[2])),
        diamondmark(gr.gpen[3]+0.25mm, linewidth(gr.gpen[3])),
        circlemark(gr.gpen[4], linewidth(gr.gpen[4]))
    };
    gr.gmark.cyclic =true;
}

