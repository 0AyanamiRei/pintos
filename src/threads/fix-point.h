#define f 1 << 14;
#define half_f f / 2;


/**
 * x, y are fixed-point numbers
 * n is an integer
*/

#define F2I_R2Zero(x) ((x) / (f));
#define NonNEG_F2I_R2Near(x) (((x) + (half_f)) / (f));
#define NEG_F2I_R2Near(x) (((x) - (half_f)) / (f));
#define F_ADD_F(x, y) ((x)+(y));
#define F_SUB_F(x, y) ((x)-(y));
#define F_ADD_I(x, n) ((x) + ((n) * (f)));
#define F_SUB_I(x, n) ((x) - ((n) * (f)));
#define F_MUL_F(x, y) (((int64_t) (x)) * (y) / (f));
#define F_MUL_I(x, n) ((x) * (n));
#define F_DIV_F(x, y) (((int64_t) (x)) * (f) / (y));
#define F_DIV_I(x, n) ((x) / (n));