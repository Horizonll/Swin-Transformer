INPUT_FILE="/cluster/home3/hrz/Swin-Transformer/out_pvt"
OUT_FILE="$(dirname "$0")/pvt_t/acc.csv"
echo "epoch,acc" > "$OUT_FILE"
awk '/\*/ && /Acc@1/ {for(i=1;i<=NF;i++) if($i=="Acc@1") print ++c "," $(i+1)}' "$INPUT_FILE" >> "$OUT_FILE" || true

OUT_FILE="$(dirname "$0")/pvt_t/loss.csv"
echo "epoch,loss" > "$OUT_FILE"
perl -nle 'if(/\[1200\/1251\]/ && /loss[^()]*\(([-+0-9.eE+\-]+)\)/){ print $1 }' "$INPUT_FILE" | nl -ba -w1 -s',' >> "$OUT_FILE"