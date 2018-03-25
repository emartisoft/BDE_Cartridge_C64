; BDE (Basic Dili Editörü) Cartridge Project

*=$8000
        WORD reset                      ; RESET entry
        WORD restore                    ; RESTORE entry
        BYTE $c3,$c2,$cd,$38,$30        ; CBM80 Autostart key

reset
                                        ; KERNEL reset routine
        stx $d016                       ; Turn on VIC
        jsr $fda3                       ; Init I/O devices
        jsr $fd50                       ; Test/Init RAM
        jsr $fd15                       ; Init system vectors
        jsr $ff5b                       ; Init screen editor
        cli                             ; Enable IRQ interrupts

                                        ; BASIC reset routine
        jsr $e453                       ; Init BASIC RAM vectors
        jsr $e3bf                       ; Main BASIC RAM init routine
        jsr $e422                       ; Power-up message / NEW command
        ldx #$fb
        txs                             ; Reduce stack pointer for BASIC

restore
        jsr $e544                       ; Clear the screen
        lda #$02
        sta $d020                       ; border color
        lda #$00
        sta $d021                       ; background color
        lda #$0F
        sta $0286                       ; cursor color

        ldx #$00                        ; Copy bytes from $8100 to $0800
loop    lda $8100,x
        sta $0800,x
        lda $8200,x
        sta $0900,x
        inx
        bne loop

                                        ; print info
        lda #<n1
        ldy #>n1
        jsr $ab1e
        lda #<n2
        ldy #>n2
        jsr $ab1e

        lda #$01                        ; cursor color
        sta $0286

        jsr $a659                       ; CLR command 
        jmp $a7ae                       ; RUN command
          
*=$8100
        ;BDE
        BYTE $00
        BYTE $0D,$08,$C2,$07,$9E,$32,$30,$36
        BYTE $33,$3A,$A2,$00,$00,$00,$A9,$00
        BYTE $85,$FE,$A2,$01,$BD,$64,$09,$85
        BYTE $FF,$A0,$00,$B1,$FE,$91,$FE,$88
        BYTE $D0,$F9,$E6,$FF,$A5,$FF,$DD,$66
        BYTE $09,$D0,$EE,$CA,$10,$E6,$A9,$74
        BYTE $A0,$08,$85,$5F,$84,$60,$A9,$EC
        BYTE $A0,$08,$85,$5A,$84,$5B,$A9,$D8
        BYTE $A0,$E4,$85,$58,$84,$59,$20,$BF
        BYTE $A3,$A9,$EC,$A0,$08,$85,$5F,$84
        BYTE $60,$A9,$64,$A0,$09,$85,$5A,$84
        BYTE $5B,$A9,$37,$A0,$E4,$85,$58,$84
        BYTE $59,$20,$BF,$A3,$A9,$35,$85,$01
        BYTE $A9,$60,$8D,$31,$A5,$A9,$E4,$8D
        BYTE $32,$A5,$60,$A0,$02,$A9,$00,$AA
        BYTE $85,$FE,$B1,$5F,$F0,$28,$C9,$20
        BYTE $D0,$03,$C8,$D0,$F5,$85,$FF,$8A
        BYTE $29,$07,$AA,$F0,$0E,$48,$A5,$FF
        BYTE $18,$2A,$69,$00,$CA,$D0,$F9,$85
        BYTE $FF,$68,$AA,$E8,$A5,$FF,$18,$65
        BYTE $FE,$85,$FE,$4C,$6F,$E4,$C0,$04
        BYTE $30,$DB,$C6,$D6,$A5,$D6,$48,$A2
        BYTE $03,$A9,$20,$9D,$01,$04,$BD,$D4
        BYTE $E4,$20,$D2,$FF,$D0,$0C,$00,$5C
        BYTE $48,$20,$C9,$FF,$AA,$68,$90,$01
        BYTE $8A,$60,$CA,$10,$E4,$A6,$FE,$A9
        BYTE $00,$20,$CD,$BD,$A9,$3E,$20,$D2
        BYTE $FF,$68,$85,$D6,$20,$6C,$E5,$A9
        BYTE $8D,$20,$D2,$FF,$4C,$BF,$E3,$09
        BYTE $3C,$12,$13,$A9,$3A,$20,$D2,$FF
        BYTE $A9,$20,$20,$D2,$FF,$A9,$00,$85
        BYTE $FB,$A0,$04,$88,$F0,$1F,$20,$CF
        BYTE $FF,$C9,$0D,$F0,$18,$38,$E9,$30
        BYTE $48,$A2,$0A,$A9,$00,$18,$65,$FB
        BYTE $CA,$D0,$FA,$85,$FB,$68,$65,$FB
        BYTE $85,$FB,$4C,$CF,$E3,$A9,$8D,$20
        BYTE $D2,$FF,$A9,$00,$8D,$05,$D4,$A9
        BYTE $F8,$8D,$06,$D4,$A9,$0F,$8D,$18
        BYTE $D4,$A5,$FB,$C5,$FE,$F0,$09,$A9
        BYTE $E8,$A2,$06,$A0,$81,$4C,$1A,$E4
        BYTE $A9,$8A,$A2,$3A,$A0,$21,$8D,$00
        BYTE $D4,$8E,$01,$D4,$8C,$04,$D4,$A2
        BYTE $00,$A0,$00,$EA,$C8,$D0,$FC,$E8
        BYTE $D0,$F9,$8E,$18,$D4,$8E,$04,$D4
        BYTE $4C,$80,$A4,$A0,$E0,$C0,$00,$E0

*=$8300
        ; Info
n1      BYTE $B0,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$AE
        BYTE $C2,$42,$44,$45,$20,$28,$42,$41
        BYTE $53,$49,$43,$20,$44,$49,$4C,$49
        BYTE $20,$45,$44,$49,$54,$4F,$52,$55
        BYTE $29,$20,$20,$20,$20,$20,$20,$20
        BYTE $20,$20,$20,$20,$20,$20,$20,$C2
        BYTE $AB,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$B3
        BYTE $C2,$43,$4F,$4D,$4D,$4F,$44,$4F
        BYTE $52,$45,$20,$44,$45,$52,$47,$49
        BYTE $53,$49,$20,$50,$52,$4F,$47,$52
        BYTE $41,$4D,$20,$44,$4F,$4B,$55,$4D
        BYTE $20,$45,$4B,$49,$20,$20,$20,$C2
        BYTE $C2,$42,$41,$53,$49,$43,$20,$50
        BYTE $52,$4F,$47,$52,$41,$4D,$4C,$41
        BYTE $52,$49,$4E,$49,$20,$48,$41,$54
        BYTE $41,$53,$49,$5A,$20,$59,$41,$5A
        BYTE $4D,$41,$4B,$20,$20,$20,$20,$C2
        BYTE $C2,$49,$43,$49,$4E,$20,$4B,$55
        BYTE $4C,$4C,$41,$4E,$49,$4C,$49,$52
        BYTE $2E,$20,$20,$20,$20,$20,$20,$20
        BYTE $20,$20,$20,$20,$20,$20,$20,$20
        BYTE $20,$20,$20,$20,$20,$20,$20,$C2
        BYTE $00
n2      BYTE $C2,$20,$20,$20,$20,$20,$20,$20
        BYTE $20,$20,$20,$20,$20,$20,$20,$20
        BYTE $20,$20,$20,$20,$20,$20,$20,$20
        BYTE $20,$20,$20,$20,$20,$20,$20,$20
        BYTE $20,$20,$20,$20,$20,$20,$20,$C2
        BYTE $C2,$53,$41,$54,$49,$52,$49,$20
        BYTE $59,$41,$5A,$44,$49,$4B,$54,$41
        BYTE $4E,$20,$53,$4F,$4E,$52,$41,$20
        BYTE $45,$4B,$52,$41,$4E,$49,$4E,$20
        BYTE $53,$4F,$4C,$20,$55,$53,$54,$C2
        BYTE $C2,$4B,$4F,$53,$45,$53,$49,$4E
        BYTE $44,$45,$20,$42,$45,$4C,$49,$52
        BYTE $45,$4E,$20,$53,$41,$59,$49,$20
        BYTE $44,$45,$52,$47,$49,$44,$45,$4B
        BYTE $49,$20,$49,$4C,$45,$20,$20,$C2
        BYTE $C2,$55,$59,$55,$53,$55,$59,$4F
        BYTE $52,$20,$49,$53,$45,$20,$53,$41
        BYTE $54,$49,$52,$49,$20,$44,$4F,$47
        BYTE $52,$55,$20,$59,$41,$5A,$4D,$49
        BYTE $53,$53,$49,$4E,$49,$5A,$20,$C2
        BYTE $C2,$44,$45,$4D,$45,$4B,$54,$49
        BYTE $52,$2E,$20,$41,$4B,$53,$49,$20
        BYTE $54,$41,$4B,$44,$49,$52,$44,$45
        BYTE $20,$48,$41,$54,$41,$20,$56,$41
        BYTE $52,$44,$49,$52,$2E,$20,$20,$C2
        BYTE $CA,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
        BYTE $C3,$C3,$C3,$C3,$C3,$C3,$C3,$CB
        BYTE $00

*=$9fff
        BYTE 0
