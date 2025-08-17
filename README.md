# Two-Layer-Wall-Model
Implementation of Two-Layer Wall Model for High Schmidt and Prandtl Numebr under Various Frictional Reynolds Number Conditions

## Model Description
The equations of two-layer scalar turbulent diffusivity can be written as,

$$
\alpha^+ \=\ 
\frac{ \beta k_{Re}\ {y^+}^3 \+\ (1-\beta)\ k_{Sc}\,{y^+}^{3.3} }
     { (k_{Re}\ y^+)^2 \+\ C_{th}^2 }
$$

The correspond integral wall model, can be expressed as,

$$
c^+ \=\ 
\int \left[
   1 + \dfrac{y^+}{Sc\ Re_\tau} \right] \frac{Sc}
        { 1 + Sc \ \dfrac{ \beta k_{Re}\ {y^+}^3 \ +\  (1-\beta)\ k_{Sc}\ {y^+}^{3.3} }
                             { (k_{Re}\ y^+)^2 \+\ C_{th}^2 } }
 \ dy^+
$$

## Sample Compairsion between Single-Layer to Two-Layer Model
<p align="center">
  <img width="417" height="315" alt="image" src="https://github.com/user-attachments/assets/92c5f26c-0a41-4792-93d9-6705549edd5a" />
</p>


## References
1. Wong, K. W.* , Mickus, I., Grishchenko, D., Kudinov, P. (2025). A Modified Two-Layer Scalar Diffusivity Description for High Schmidt and Prandtl Turbulent Boundary Layer. *Physics of Fluids*, 37(2), 025219. [Link](https://pubs.aip.org/aip/pof/article/37/2/025219/3337468/A-modified-two-layer-scalar-diffusivity)
2. Wong, K. W.\*, Mickus, I., Grishchenko, D., Kudinov, P. (2024). Enabling Passive Scalar Wall Modelling in Large Eddy Simulation for Turbulent Flows at High Schmidt or Prandtl Numbers, Abstract Submitted to 31th International Conference on Nuclear Engineering (ICONE-31), Prague, Czech Republic.
3. Wong, K. W.\*, Mickus, I., Grishchenko, D., Kudinov, P. (2024). Empirical Two-Layer Model for Predicting Near-Wall Diffusive Flux at High Schimdt or Prandtl Numbers, 12th International Conference in Computational Fluid Dynamics (ICCFD-12), Kobe, Japan.


