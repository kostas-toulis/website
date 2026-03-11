#!/bin/bash

# Image Compression Script for SEO Optimization
# Target: Reduce image sizes while maintaining quality

echo "Starting image compression for SEO optimization..."

# Check if jpegoptim is installed
if ! command -v jpegoptim &> /dev/null; then
    echo "jpegoptim not found. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install jpegoptim
    else
        sudo apt-get install jpegoptim
    fi
fi

# Compress large images with specific targets
echo "Compressing critical images..."

# 1.3MB image - target <200KB
echo "Compressing γραφειο1.jpg (1.3MB -> target <200KB)..."
jpegoptim --max=75 --overwrite --totals "/Users/Toulis/Downloads/PrivatePractice WebSite/website-master/images/γραφειο1.jpg"

# 571KB image - target <100KB  
echo "Compressing cta-parallax.jpg (571KB -> target <100KB)..."
jpegoptim --max=70 --overwrite --totals "/Users/Toulis/Downloads/PrivatePractice WebSite/website-master/images/cta-parallax.jpg"

# Background images - target <50KB each
echo "Compressing background images..."
jpegoptim --max=80 --overwrite --totals "/Users/Toulis/Downloads/PrivatePractice WebSite/website-master/images/bg-image-1.jpg"
jpegoptim --max=80 --overwrite --totals "/Users/Toulis/Downloads/PrivatePractice WebSite/website-master/images/bg-image-2.jpg"
jpegoptim --max=80 --overwrite --totals "/Users/Toulis/Downloads/PrivatePractice WebSite/website-master/images/bg-image-4.jpg"

# Compress screenshot gallery images
echo "Compressing screenshot gallery images..."
find "/Users/Toulis/Downloads/PrivatePractice WebSite/website-master/images/screenshots/" -name "*.jpg" -exec jpegoptim --max=85 --overwrite --totals {} \;

echo "Image compression completed!"
echo "Run 'ls -lh' to verify file size reductions"
