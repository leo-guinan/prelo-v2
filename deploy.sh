#!/bin/bash

# Update all submodules
git submodule update --init --recursive

# Deploy each component
for module in frontend backend shared-lib; do
    if [ -d "$module" ]; then
        echo "Deploying $module..."
        cd $module
        
        # Run module-specific deployment steps
        if [ -f "deploy.sh" ]; then
            ./deploy.sh
        fi
        
        cd ..
    fi
done