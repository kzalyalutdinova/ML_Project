$DatasetNames = @(
    "lm",
    #"tless",
    #"ycbv",
    #"tyol"
)

ForEach ($name in $DatasetNames) {
    Invoke-WebRequest ("https://huggingface.co/datasets/bop-benchmark/$name/resolve/main/" + $name + "_base.zip") -OutFile ($name + "_base.zip")
    Invoke-WebRequest ("https://huggingface.co/datasets/bop-benchmark/$name/resolve/main/" + $name + "_models.zip") -OutFile ($name + "_models.zip")
}

ForEach ($name in $DatasetNames) {
    Expand-Archive -Path($name + "_base.zip") -DestinationPath .\bop
    Expand-Archive -Path ($name + "_models.zip") -DestinationPath (".\bop\" + $name)
}

ForEach ($name in $DatasetNames) {
    Remove-Item ($name + "_base.zip")
    Remove-Item ($name + "_models.zip")
}
