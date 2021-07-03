#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

/* Só tem decomposicao Cholesky se a matriz for simetrica definida positiva, ou seja, se os elementos da diagonal forem positivos (por ser simétrica).
A decomposicao de Cholesky é A = GGt, onde G é triangular inferior, com os elementos calculados como no caderno.
O sistema linear é calculado como Gy=b e Gtx = y*/

typedef struct timeval sTime;

void acharDecomposicaoCholesky(float*, float*, float*, int);
//void imprimirMatriz(matriz);
void acharValoresG(float*, int, float**);
void acharValoresGt(float*, int, float**);
void imprimirValores(float*, int);
float calcularTempoGasto(sTime, sTime); //em segundos

int tam, tamC;

int main()
{
    float *mat, *G, *Gt;
    int i, j;
    float *variaveis = NULL;
    sTime t1, t2;

    gettimeofday(&t1, NULL);


    scanf("%d", &tam);
		tamC = tam+1;

    mat = (float*)calloc((tam)*(tam+1), sizeof(float*));
    G = (float*)calloc((tam)*(tam+1), sizeof(float*));
    Gt = (float*)calloc((tam)*(tam+1), sizeof(float*));

    for(i = 0; i < tam; i++)
    {
        for(j = 0; j < tam; j++)
        {
            scanf("%f", (mat + (tamC*i) + j));
        }
        scanf("%f", (G + (tamC*i) + tam));
    }
    
    acharDecomposicaoCholesky(mat, G, Gt, tam);

    acharValoresG(G, tam, &variaveis);

    if(variaveis)
    {
        for(i = 0; i < tam; i++)
        {
            *(Gt + (tamC*i) + tam) = *(variaveis + i);
        }

        acharValoresGt(Gt, tam, &variaveis);
        //imprimirValores(variaveis, tam);
        free(variaveis);
    }

    free(mat);
    free(G);
    free(Gt);

    gettimeofday(&t2, NULL);

  	printf("%lf\n", calcularTempoGasto(t1, t2));

    return 0;
}

void acharDecomposicaoCholesky(float *pMat, float *pG, float *pGt, int tam)
{
    int l, i, j, k;
    float soma;

    for(i = 0; i < tam; i++)
    {
    	for(j = 0; j < i; j++)
    	{
    		soma = 0;
	    	for(k = 0; k < j; k++)
	    	{
	    		soma += (*(pG + (tamC*i) + k) * (*(pG + (tamC*j) + k)));
            }
	    	*(pGt + (tamC*j) + i) = *(pG + (tamC*i) + j) = (*(pMat + (tamC*i) + j) - soma)/(*(pG + (tamC*j) + j));
        }

    	soma = 0;
	  	for(k = 0; k < j; k++)
	  	{
	  		soma += ((*(pG + (tamC*i) + k)) * (*(pG + (tamC*i) + k)));
        }
	  	*(pGt + (tamC*i) + i) = *(pG + (tamC*i) + i) = sqrt((*(pMat + (tamC*i) + i)) - soma);
    }
}


//void imprimirMatriz(matriz mat)
//{
//    int i, j;
//    for(i = 0; i < mat.m; i++)
//    {
//        //for(j = 0; j < n-1; j++)
//        for(j = 0; j <= mat.n; j++)//for(j = 0; j < mat.n+1; j++)
//        {
//            //printf("%s %lf*x%d ", ((j)?"+":""), dados[i][j], j);
//            printf("%.0lf ", mat.dados[i][j]);
//        }
//        //printf("= %lf\n", dados[i][j]);
//        printf("\n");
//    }
//}


void acharValoresG(float *mat, int tam, float **var)
{
    int i, j;
    
    *var = (float *)malloc(tam*sizeof(float));

    for(i = 0; i < tam; i++)
    {
        *((*var) + i) = *(mat + (tamC*i) + tam);
        for(j = i-1; j >= 0; j--)
        {
            *((*var) + i) -= ((*(mat + (tamC*i) + j)) * (*((*var) + j)));
        }
        *((*var) + i) /= (*(mat + (tamC*i) + i));
    }
}

void acharValoresGt(float *mat, int tam, float **var)
{
	int i, j;
    for(i = tam-1; i >= 0; i--)
    {
        *((*var) + i) = *(mat + (tamC*i) + tam);
        for(j = i+1; j < tam; j++)
        {
            *((*var) + i) -= ((*(mat + (tamC*i) + j)) * (*((*var) + j)));
        }
        *((*var) + i) /= (*(mat + (tamC*i) + i));
    }
}

void imprimirValores(float* var, int qtde)
{
    int i;
    for(i = 0; i < qtde; i++)
    {
        //printf("x%d = %lf\n", i, var[i]);
        printf("%f\n", var[i]);
    }

}

float calcularTempoGasto(sTime tI, sTime tF)
{
    float result = (tF.tv_sec - tI.tv_sec);
    result += ((tF.tv_usec - tI.tv_usec) / 1000000.0 ); //us para segundos;
    return result;
}

