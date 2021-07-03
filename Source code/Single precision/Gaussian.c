#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>


typedef struct timeval sTime;

void acharFormaEscalonada(float*);
void imprimirMatriz(float*);
void acharValores(float*, float**);
void imprimirValores(float*, int);
float calcularTempoGasto(sTime, sTime); //em segundos

int tam, tamC;

int main()
{
    float *mat;
    int i, j;
    float *variaveis = NULL;
    sTime t1, t2;
    float *ptAux;

    gettimeofday(&t1, NULL);

    scanf("%d", &tam);
		tamC = tam+1;

    mat = (float*)calloc(tam*(tam+1), sizeof(float*));

    for(i = 0; i < tam; i++)
    {
        for(j = 0; j < tam+1; j++)
        {
            scanf("%f", (mat + (tamC*i) + j));
        }
    }

    acharFormaEscalonada(mat);
    //imprimirMatriz(mat);
    acharValores(mat, &variaveis);
    if(variaveis)
    {
        //imprimirValores(variaveis, tam);
        free(variaveis);
    }

    free(mat);

    gettimeofday(&t2, NULL);

    printf("%lf\n", calcularTempoGasto(t1, t2));

    return 0;
}

void acharFormaEscalonada(float *pMat)
{
    int l, i, j, k, index;
    float aux;
    int line = 0;

    for(l = 0; l < tam; l++)
    {
        index = line;
        for(k = line; k < tam; k++)
        {
            if(abs(*(pMat + (tamC*k) + l)) > 0)
            {
                index = k;
                break;
            }
        }
        if(*(pMat + (tamC*index) + l) == 0)
        {
            continue;
        }

        if(index != line)
        {
            for(i = 0; i < tam; i++)
            {
                aux = *(pMat + (tamC*index) + i);
                *(pMat + (tamC*index) + i) = *(pMat + (tamC*line) + i);
                *(pMat + (tamC*line) + i);
            }
        }

        for(i = line+1; i < tam; i++)
        {
            for(j = tam; j >= l; j--)
            {
                *(pMat + (tamC*i) + j) -= (*(pMat + (tamC*i) + l)) * (*(pMat + (tamC*line) + j)) / (*(pMat + (tamC*line) + l));
            }
        }
        line++;
        if(line >= tam) break;
    }
}


//void imprimirMatriz(matriz mat)
//{
//    int i, j;
//    for(i = 0; i < mat.m; i++)
//    {
//        //for(j = 0; j < n-1; j++)
//        for(j = 0; j < mat.n+1; j++)
//        {
//            //printf("%s %lf*x%d ", ((j)?"+":""), dados[i][j], j);
//            printf("%lf ", mat.dados[i][j]);
//        }
//        //printf("= %lf\n", dados[i][j]);
//        printf("\n");
//    }
//}


void acharValores(float *mat, float **var)
{
    int i, j, zeros, infSols = 0;

    for(i = 0; i < tam; i++)
    {
    	zeros = 1;
    	for(j = 0; j < tam; j++)
    	{
    		if(*(mat + (tamC*i) + j) != 0.0)
    		{
    			zeros = 0;
    			break;
			}
		}
		if(zeros)
        {
            if(*(mat + (tamC*i) + j))
            {
                printf("Sistema impossivel\n");
                return;
            }
            infSols = 1;
        }
    }
    if(infSols)
    {
        printf("Sistema nao tem solucao definida\n");
        return;
    }
    *var = (float *)malloc(tam*sizeof(float));

    for(i = tam-1; i >= 0; i--)
    {
        *((*var) + i) = *(mat + (tamC*i) + tam);
        for(j = i+1; j < tam; j++)
        {
            *((*var) + i) -= ((*(mat + (tamC*i) + j)) * (*((*var) + j)));
        }
        *((*var) + i) /= *(mat + (tamC*i) + i);
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

