

The objective of this repository is to find why the css of nbsphinx is not working
for me, even after (this issue)[https://github.com/spatialaudio/nbsphinx/issues/182]
and after this (pull request)[https://github.com/spatialaudio/nbsphinx/pull/228].


First in some folder in your computer make a folder and open a terminal in this
folder ans run this command:

```
git clone https://github.com/PedroRegisPOAR/nbsphinx-issue-182.git
```

Build the image:

```
docker build -t pedro/nbsphinx .
```

Running the image:

```
docker run -it --rm -v "$(pwd)":/code pedro/nbsphinx bash
```

You can check if you are in the right place and mapped correctly the volume using
the `ls` command:

```
root@7323bb5d11d0:/code# ls
Dockerfile  README.txt	requirements.txt  sphinx
```

Change directory to sphinx
```
root@7323bb5d11d0:/code# cd sphinx
root@7323bb5d11d0:/code/sphinx# ls
Makefile  _build  _static  _templates  conf.py	index.rst  notebook.html  notebook.ipynb
```

In the shell of the container and in the sphinx folder:

```
make clean
```

```
make html
```
And the doc should be generated.


If you want to run the jupyter notebook

Open a new terminal in the folder that you cloned and run:

```
docker run -it --rm -v "$(pwd)":/code -p 8888:8888 nbsphinx bash
```

Change directory to sphinx
```
root@7323bb5d11d0:/code# cd sphinx
root@7323bb5d11d0:/code/sphinx# ls
Makefile  _build  _static  _templates  conf.py	index.rst  notebook.html  notebook.ipynb
```

In the shell of the container:

```
jupyter-notebook --ip="0.0.0.0" --no-browser --allow-root
```

And paste the correct url in the browser, in my case it is:
```
http://127.0.0.1:8888/?token=c9437f633dd9406e4b6d96731d7faa2fa2d2cddba346c7a8
```
Note: the token will be different in your case.

If you want to convert the notebook stop the jupyter notebook and run the below
command:

```
jupyter nbconvert --to html notebook.ipynb
```
