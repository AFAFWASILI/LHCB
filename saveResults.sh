logpath_list=(
    "output/Gen/UC/*.log"
    "output/Gen/QC/*.log"
    "output/JointFit/Coordinator/*.log"
    "output/JointFit/UC/*.log"
    "output/JointFit/QC/*.log"
    "output/JointFit/Results/Plots/*.png"
    "output/JointFit/Results/*.csv"
    "output/FittingTests/**/Logs/*"
    "output/FittingTests/**/Results/*"
    "output/AmpModel/**/Logs/*"
    "output/AmpModel/**/Results/*"
    "output/AmpModel/*.txt"
)

logfile_name="logs/logs_"$(date "+%Y-%m-%d_%H:%M").tar.gz

tar -cf $logfile_name ${logpath_list[@]} 2>/dev/null

echo "Log files saved to "$logfile_name