#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

/* Só tem Decomposicao QR matrizes com posto máximo, ou seja, matrizes invertíveis (det != 0)
Decomposicao QR: A = QR, onde Q e matriz ortogonal (vetores ortonormais nas colunas) e R triangular superior.
Q eh achada por Gram-Schmidt e R sao os coeficientes desse processo
Videos sobre: https://www.youtube.com/watch?v=qmRC8mTPGI8 e https://www.youtube.com/watch?v=c_QCR20nTDY
Site com a resolução de sistemas lineares com QR: http://www.sawp.com.br/blog/?p=689 */

typedef struct timeval sTime;

double calcularDeterminanteCofator(double*, int);
double calcularProdutoInterno(double*, double*, int);
void acharDecomposicaoQR(double*, double*, int);
void imprimirMatriz(double*, int);
void imprimirMatrizQ(double*, int);
void acharValoresR(double*, int, double**);
void imprimirValores(double*, int);
void multiplicarMatrizQPorVetorB(double*, int,  double**);
double calcularTempoGasto(sTime, sTime); //em segundos

int tam, tamC;

int main()
{
    double *mat, *Q, *R;
    int i, j, tam;
    double *variaveis = NULL;
    sTime t1, t2;

    gettimeofday(&t1, NULL);

    scanf("%d", &tam);
		tamC = tam;

    mat = (double*)calloc(tam*tam, sizeof(double*));
    Q = (double*)calloc(tam*tam, sizeof(double*));
    R = (double*)calloc(tam*(tam+1), sizeof(double*));

    variaveis = (double*)malloc(tam*sizeof(double));

    for(i = 0; i < tam; i++)
    {
        for(j = 0; j < tam; j++)
        {
            scanf("%lf", (mat + (tam*i) + j));
            *(Q + (tam*j) + i) = *(mat + (tam*i) + j);
        }
        scanf("%lf", (variaveis + i));
    }

    acharDecomposicaoQR(Q, R, tam);

    multiplicarMatrizQPorVetorB(Q, tam, &variaveis);

    for(i = 0; i < tam; i++)
    {
        *(R + (tamC*i) + tam) = *(variaveis + i);
    }
    acharValoresR(R, tam, &variaveis);

    //imprimirValores(variaveis, tam);

	  free(variaveis);

    free(mat);
    free(Q);
    free(R);

    gettimeofday(&t2, NULL);

    printf("%lf\n", calcularTempoGasto(t1, t2));

    return 0;
}

double calcularProdutoInterno(double *vec1, double *vec2, int tam)
{
    int i;
    double soma = 0;
    for(i = 0; i < tam; i++)
    {
        soma += ((*(vec1 + i)) * (*(vec2 + i)));
    }
    return soma;
}

void acharDecomposicaoQR(double *pQ, double *pR, int tam) {
    int i, j, k;
    double *vAtual;
    double coeficienteFourier, norma;

    for(j = 0; j < tam; j++)
    {
        vAtual = (pQ + (tam*j));
        for(i = j-1; i >= 0; i--)
        {
            coeficienteFourier = calcularProdutoInterno(vAtual, (pQ + (tam*i)), tam)/calcularProdutoInterno((pQ + (tam*i)), (pQ + (tam*i)), tam);
            *(pR + (tamC*i) + j) = coeficienteFourier;
            for(k = 0; k < tam; k++)
            {
                *(pQ + (tam*j) + k) -= coeficienteFourier*(*(pQ + (tam*i) + k));
            }
        }
        norma = sqrt(calcularProdutoInterno((pQ + (tam*j)), (pQ + (tam*j)), tam));
        *(pR + (tam*j) + j) = norma;
        for(k = 0; k < tam; k++)
        {
            *(pQ + (tam*j) + k) /= norma;
        }
    }
}


//void imprimirMatriz(matriz mat)
//{
//    int i, j;
//    for(i = 0; i < mat.m; i++)
//    {
//        //for(j = 0; j < n-1; j++)
//        for(j = 0; j < mat.n; j++)//for(j = 0; j < mat.n+1; j++)
//        {
//            //printf("%s %lf*x%d ", ((j)?"+":""), dados[i][j], j);
//            printf("%lf ", mat.dados[i][j]);
//        }
//        //printf("= %lf\n", dados[i][j]);
//        printf("\n");
//    }
//}

//void imprimirMatrizQ(matriz mat)
//{
//    int i, j;
//    for(i = 0; i < mat.m; i++)
//    {
//        //for(j = 0; j < n-1; j++)
//        for(j = 0; j < mat.n; j++)//for(j = 0; j < mat.n+1; j++)
//        {
//            //printf("%s %lf*x%d ", ((j)?"+":""), dados[i][j], j);
//            printf("%lf ", mat.dados[j][i]);
//        }
//        //printf("= %lf\n", dados[i][j]);
//        printf("\n");
//    }
//}

void acharValoresR(double *mat, int tam, double **var)
{
	int i, j;
	
    for(i = tam-1; i >= 0; i--)
    {
        *((*var) + i) = *(mat + (tam*i) + tam);
        for(j = i+1; j < tam; j++)
        {
            *((*var) + i) -= ((*(mat + (tam*i) + j)) * (*((*var) + j)));
        }
        *((*var) + i) /= *(mat + (tam*i) + i);
    }
}

void imprimirValores(double* var, int qtde)
{
    int i;
    for(i = 0; i < qtde; i++)
    {
        //printf("x%d = %lf\n", i, var[i]);
        printf("%lf\n", var[i]);
    }

}

void multiplicarMatrizQPorVetorB(double *Q, int tam, double **pB)
{
    int i, j, k;
    double *result;

    result = (double *)malloc(tam*sizeof(double));
    for(i = 0; i < tam; i++)
    {
        *(result + i) = 0;
        for(k = 0; k < tam; k++)
        {
            //printf("Q.dados[%d][%d] = %lf\n", i, k, *(*(Q.dados+i)+k));
            //printf("b[%d] = %lf\n", k, *(*pB+k));
            //printf("mult = %lf\n", ((*(*(Q.dados+i)+k))*(*(*pB+k))));
            *(result + i) += ((*(Q+(tam*i)+k))*(*((*pB)+k)));
        }
        //printf("result[%d] = %lf\n", i, result[i]);
    }
    for(i = 0; i < tam; i++)
    {
        *((*pB) + i) = *(result + i);
    }
}

double calcularTempoGasto(sTime tI, sTime tF)
{
    double result = (tF.tv_sec - tI.tv_sec);
    result += ((tF.tv_usec - tI.tv_usec) / 1000000.0 ); //us para segundos;
    return result;
}

