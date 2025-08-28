# CDMP Exam App - Deployment Guide

## Deploying to cdmp.riptonic.com

This guide will help you deploy the CDMP Exam Study App to `cdmp.riptonic.com` using Vercel and Squarespace.

## Prerequisites

- GitHub account
- Vercel account (linked to GitHub)
- Access to your Squarespace domain settings for riptonic.com

## Step 1: Push to GitHub

1. Create a new GitHub repository called `cdmp-exam-app`
2. Push this project to GitHub:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: CDMP Exam Study App"
   git branch -M main
   git remote add origin https://github.com/yourusername/cdmp-exam-app.git
   git push -u origin main
   ```

## Step 2: Deploy to Vercel

1. Go to [vercel.com](https://vercel.com) and log in
2. Click "New Project"
3. Import your `cdmp-exam-app` repository from GitHub
4. Configure the project:
   - **Project Name**: `cdmp-exam-app`
   - **Framework Preset**: Other
   - **Root Directory**: ./
   - **Build Command**: Leave empty (static site)
   - **Output Directory**: Leave empty
   - **Install Command**: `npm install` (optional)
5. Click "Deploy"

## Step 3: Configure Custom Domain in Vercel

1. Once deployed, go to your project dashboard in Vercel
2. Click on "Settings" → "Domains"
3. Add custom domain: `cdmp.riptonic.com`
4. Vercel will provide DNS records you need to configure

## Step 4: Configure DNS in Squarespace

1. Log in to your Squarespace account
2. Go to Settings → Domains → riptonic.com
3. Click "Advanced Settings" → "Custom Records"
4. Add the DNS records provided by Vercel:
   - **Type**: CNAME
   - **Host**: cdmp
   - **Data**: [The value provided by Vercel, usually something like cname.vercel-dns.com]

## Step 5: SSL Certificate

Vercel automatically provides SSL certificates for custom domains. Once DNS propagates (can take up to 48 hours), your site will be available at `https://cdmp.riptonic.com`.

## File Structure

```
cdmp-exam-app/
├── main.html                          # Main application
├── index.html                         # Redirect to main.html
├── cdmp_questions_full_exam_clean.db  # Question database
├── cdmp-questions-js.js               # JavaScript fallback data
├── vercel.json                        # Vercel configuration
├── package.json                       # Project metadata
├── .gitignore                         # Git ignore rules
├── CLAUDE.md                          # Project documentation
├── readme.md                          # Original readme
└── archive/                           # Archived files
    └── [various development files]
```

## Configuration Files Created

- **`vercel.json`**: Configures Vercel deployment with proper routing and headers
- **`index.html`**: Redirect page to main.html for root access
- **`package.json`**: Project metadata and scripts
- **`.gitignore`**: Excludes unnecessary files from git

## Testing

After deployment, test the following:
1. Visit `https://cdmp.riptonic.com` - should redirect to main app
2. Verify all knowledge areas load correctly
3. Test both Practice and Exam modes
4. Verify mobile responsiveness

## Troubleshooting

**Database Loading Issues:**
- Ensure `cdmp_questions_full_exam_clean.db` is included in the deployment
- Check browser console for CORS or loading errors

**Domain Not Working:**
- Verify DNS records are correctly set in Squarespace
- Wait for DNS propagation (up to 48 hours)
- Check Vercel domain status

**App Not Loading:**
- Verify all files are committed to GitHub
- Check Vercel build logs for errors
- Ensure SQL.js CDN is accessible

## Support

For issues with:
- **Vercel deployment**: Check Vercel docs or support
- **Domain configuration**: Contact Squarespace support
- **App functionality**: Check browser console for JavaScript errors