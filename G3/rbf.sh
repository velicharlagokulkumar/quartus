quartus_pfg -c \
   build/G3_r1.sof \
   prbs_7.jic \
   -o device=MT25QU02G \
   -o flash_loader=AGFB027R24C2E2V \
   -o hps_path=agfb027_fsbl/u-boot-spl-dtb.hex \
   -o mode=ASX4 \
   -o hps=1
