#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

/* A matriz U fica com a diagonal igual a 1 tbm e a matriz D (que é diagonal) fica com os valores da diagonal da antiga.
Resolve em três passos: LDUx=b onde Lz=b, Dy=z e Ux=y */

typedef struct timeval sTime;

void acharDecomposicaoLDU(double*, double*, double*, int);
void imprimirMatriz(double*, int);
void acharValoresL(double*, int, double**);
void acharValoresD(double*, int, double**);
void acharValoresU(double*, int, double**);
void imprimirValores(double*, int);
double calcularTempoGasto(sTime, sTime); //em segundos

int tam, tamC;

int main()
{
    double *mat, *L, *D;
    int i, j;
    double *variaveis = NULL;
    sTime t1, t2;

    gettimeofday(&t1, NULL);

    scanf("%d", &tam);
    tamC = tam+1;

    mat = (double*)calloc(tam*(tam+1), sizeof(double*));
    L = (double*)calloc(tam*(tam+1), sizeof(double*));
    D = (double*)calloc(tam*(tam+1), sizeof(double*));

    for(i = 0; i < tam; i++)
    {
        *(L + (tamC*i) + i) = 1;
        for(j = 0; j < tam; j++)
        {
            scanf("%lf", (mat + (tamC*i) + j));
        }
        scanf("%lf", (L + (tamC*i) + j));
    }


    acharDecomposicaoLDU(mat, L, D, tam);
		acharValoresL(L, tam, &variaveis);
		if(variaveis)
    {
    	for(i = 0; i < tam; i++)
		  {
		      *(D + (tamC*i) + tam) = *(variaveis + i);
		  }
    		acharValoresD(D, tam, &variaveis);

			for(i = 0; i < tam; i++)
		  {
		      *(mat + (tamC*i) + tam) = *(variaveis + i);
		  }
    		acharValoresU(mat, tam, &variaveis);

        //imprimirValores(variaveis, tam);
        free(variaveis);
    }

    free(mat);
    free(L);
    free(D);

    gettimeofday(&t2, NULL);

    printf("%lf\n", calcularTempoGasto(t1, t2));

    return 0;
}

void acharDecomposicaoLDU(double *pMat, double *pL, double *pD, int tam)
{
    int l, i, j, k;
    double coeficiente;

    for(l = 0; l < tam; l++)
    {
        for(i = l+1; i < tam; i++)
        {
        	coeficiente = (*(pMat + (tamC*i) + l)) / (*(pMat + (tamC*l) + l));
            *(pL + (tamC*i) + l) = coeficiente;
            for(j = tam-1; j >= l; j--)
            {
                *(pMat + (tamC*i) + j) -= (*(pMat + (tamC*l) + j)) * coeficiente;
            }
        }
        *(pD + (tamC*l) + l) = *(pMat + (tamC*l) + l);
        for(j = tam-1; j >= l; j--)
        {
        	*(pMat + (tamC*l) + j) /= (*(pMat + (tamC*l) + l));
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


void acharValoresL(double *mat, int tam, double **var)
{
    int i, j;
    
    *var = (double *)malloc(tam*sizeof(double));

    for(i = 0; i < tam; i++)
    {
        *((*var) + i) = *(mat + (tamC*i) + tam);
        for(j = i-1; j >= 0; j--)
        {
            *((*var) + i) -= ((*(mat + (tamC*i) + j)) * (*((*var) + j)));
        }
        *((*var) + i) /= *(mat + (tamC*i) + i);
    }
}

void acharValoresD(double *mat, int tam, double **var)
{
	int i, j;

    for(i = 0; i < tam; i++)
    {
        *((*var) + i) = (*(mat + (tamC*i) + tam))/(*(mat + (tamC*i) + i));
    }
}

void acharValoresU(double *mat, int tam, double **var)
{
		int i, j;
    for(i = tam-1; i >= 0; i--)
    {
        *((*var) + i) = (*(mat + (tamC*i) + tam));
        for(j = i+1; j < tam; j++)
        {
            *((*var) + i) -= ((*(mat + (tamC*i) + j)) * (*((*var) + j)));
        }
        *((*var) + i) /= *(mat + (tamC*i) + i);
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

double calcularTempoGasto(sTime tI, sTime tF)
{
    double result = (tF.tv_sec - tI.tv_sec);
    result += ((tF.tv_usec - tI.tv_usec) / 1000000.0 ); //us para segundos;
    return result;
}
