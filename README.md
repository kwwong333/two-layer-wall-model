# Two-Layer Model for High Schmidt and Prandtl Turbulent Boundary Layer
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
        { 1 + Sc \ \left[ \dfrac{ \beta k_{Re}\ {y^+}^3 \ +\  (1-\beta)\ k_{Sc}\ {y^+}^{3.3} }
                    { (k_{Re}\ y^+)^2 \+\ C_{th}^2 } \right]} dy^+
$$

## References
### Journal Publications
1. Wong, K. W.* , Mickus, I., Grishchenko, D., Kudinov, P. (2025). A Modified Two-Layer Scalar Diffusivity Description for High Schmidt and Prandtl Turbulent Boundary Layer. *Physics of Fluids*, 37(2), 025219. [Link](https://pubs.aip.org/aip/pof/article/37/2/025219/3337468/A-modified-two-layer-scalar-diffusivity) [Main Reference for the Two Layer Model]
### Conference Publications
1. Wong, K. W.\*, Mickus, I., Grishchenko, D., Kudinov, P. (2025). RANS Validation of Two-Layer Scalar Diffusivity Model for High Schmidt Mass Transfer Problems, the 21th International Topical Meeting on Nuclear Reactor Thermal-Hydraulics (NURETH-21), Busan, Korea. 
2. Wong, K. W.\*, Mickus, I., Grishchenko, D., Kudinov, P. (2024). Enabling Passive Scalar Wall Modelling in Large Eddy Simulation for Turbulent Flows at High Schmidt or Prandtl Numbers, 31th International Conference on Nuclear Engineering (ICONE-31), Prague, Czech Republic. [Link](https://asmedigitalcollection.asme.org/ICONE/proceedings-abstract/ICONE31/88315/V011T15A003/1208429)
3. Wong, K. W.\*, Mickus, I., Grishchenko, D., Kudinov, P. (2024). Empirical Two-Layer Model for Predicting Near-Wall Diffusive Flux at High Schimdt or Prandtl Numbers, 12th International Conference in Computational Fluid Dynamics (ICCFD-12), Kobe, Japan. [Link](https://www.iccfd.org/iccfd12/assets/pdf/papers/ICCFD12_Paper_13-B-04.pdf)

## Acknowledgement
Current research was supported by the Swedish Foundation for Strategic Research (SSF) through Grant No. ARC190043 granted to the Sustainable Nuclear Energy Research in Sweden (SUNRISE) project.

<img width="152" height="72" alt="image" src="https://github.com/user-attachments/assets/33cd5985-9d10-4a38-88fe-9eb29075a121" /> <img width="105" height="80" alt="image" src="https://github.com/user-attachments/assets/f5406908-ad2c-46fd-ab41-e4452d636c5a" />


