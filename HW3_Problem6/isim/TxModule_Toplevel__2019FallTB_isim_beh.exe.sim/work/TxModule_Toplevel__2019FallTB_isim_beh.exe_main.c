/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002785924098_1938225339_init();
    work_m_00000000001157986690_1191455545_init();
    work_m_00000000003952286013_2272814566_init();
    work_m_00000000003685836429_3801624240_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003685836429_3801624240");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
