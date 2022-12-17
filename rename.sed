s,GPCLK,CLK,g

# rename functions to match the names
# used in the bcm283x mapping,
# i.e. rename from TXD1 to UART1_TX
s/TXD\([0-9]\)/UART\1_TX/g
s/RXD\([0-9]\)/UART\1_RX/g
s/CTS\([0-9]\)/UART\1_CTS/g
s/RTS\([0-9]\)/UART\1_RTS/g

# prefix with I2C
s,SDA\([0-9]\),I2C\1_SDA,g
s,SCL\([0-9]\),I2C\1_SCL,g

# SPI: use CS, not CEx_N, CLK rather than SCLK
s,SPI\([0-9]\)_CE\([0-9]\)_N,SPI\1_CS\2,g
s,SPI\([0-9]\)_SCLK,SPI\1_CLK,g

# use I2S rather than PCM naming
s,PCM_,I2S_,g
s,I2S_FS,I2S_WS,g
s,I2S_CLK,I2S_SCK,g

#s,PWM0_,PWM,g
