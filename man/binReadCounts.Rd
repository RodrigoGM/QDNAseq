%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  binReadCounts.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{binReadCounts}
\alias{binReadCounts}


\title{Calculate binned read counts from a set of BAM files}

\usage{
binReadCounts(bins, bamfiles=NULL, path=NULL, ext="bam", bamnames=NULL, phenofile=NULL,
  chunkSize=NULL, cache=getOption("QDNAseq::cache", FALSE), force=!cache, isPaired=NA,
  isProperPair=NA, isUnmappedQuery=FALSE, hasUnmappedMate=NA, isMinusStrand=NA,
  isMateMinusStrand=NA, isFirstMateRead=NA, isSecondMateRead=NA, isSecondaryAlignment=NA,
  isNotPassingQualityControls=FALSE, isDuplicate=FALSE, minMapq=37, pairedEnds=NULL)
}

\description{
    Calculate binned read counts from a set of BAM files.
}

\arguments{
    \item{bins}{A data.frame or an \code{\link[Biobase]{AnnotatedDataFrame}} object
        containing bin annotations.}
    \item{bamfiles}{A character vector of (BAM) file names. If NULL (default),
        all files with extension ext, are read from directory path.}
    \item{path}{If bamfiles is NULL, directory path to read input files from.
        Defaults to the current working directory.}
    \item{ext}{File name extension of input files to read, default is "bam".}
    \item{bamnames}{An optional character vector of sample names. Defaults to
        file names with extension ext removed.}
    \item{phenofile}{An optional character(1) specifying a file name for
        phenotype data.}
    \item{chunkSize}{An optional integer specifying the chunk size (nt) by
        which to process the bam file.}
    \item{cache}{Whether to read and write intermediate cache files, which
        speeds up subsequent analyses of the same files. Requires packages
        R.cache and digest (both available on CRAN) to be installed. Defaults
        to getOption("QDNAseq::cache", FALSE).}
    \item{force}{When using the cache, whether to force reading input data
        from the BAM files even when an intermediate cache file is present.}
    \item{isPaired}{A logical(1) indicating whether unpaired (FALSE), paired
        (TRUE), or any (NA, default) read should be returned.}
    \item{isProperPair}{A logical(1) indicating whether improperly paired
        (FALSE), properly paired (TRUE), or any (NA, default) read should be
        returned. A properly paired read is defined by the alignment algorithm
        and might,    e.g., represent reads aligning to identical reference
        sequences and with a specified distance.}
    \item{isUnmappedQuery}{A logical(1) indicating whether unmapped
        (TRUE), mapped (FALSE, default), or any (NA) read should be returned.}
    \item{hasUnmappedMate}{A logical(1) indicating whether reads with mapped
        (FALSE), unmapped (TRUE), or any (NA, default) mate should be
        returned.}
    \item{isMinusStrand}{A logical(1) indicating whether reads aligned to
        the plus (FALSE), minus (TRUE), or any (NA, default) strand should be
        returned.}
    \item{isMateMinusStrand}{A logical(1) indicating whether mate reads
        aligned to the plus (FALSE), minus (TRUE), or any (NA, default) strand
        should be returned.}
    \item{isFirstMateRead}{A logical(1) indicating whether the first mate
        read should be returned (TRUE) or not (FALSE), or whether mate read
        number should be ignored (NA, default).}
    \item{isSecondMateRead}{A logical(1) indicating whether the second mate
        read should be returned (TRUE) or not (FALSE), or whether mate read
        number
        should be ignored (NA, default).}
    \item{isSecondaryAlignment}{A logical(1) indicating whether alignments
        that are primary (FALSE), are not primary (TRUE) or whose primary
        status does not matter (NA, default) should be returned. A non-primary
        alignment ("secondary alignment" in the SAM specification) might
        result when a read aligns to multiple locations. One alignment is
        designated as primary and has this flag set to FALSE; the remainder,
        for which this flag is TRUE, are designated by the aligner as
        secondary.}
    \item{isNotPassingQualityControls}{A logical(1) indicating whether
        reads passing quality controls (FALSE, default), reads not passing
        quality controls (TRUE), or any (NA) read should be returned.}
    \item{isDuplicate}{A logical(1) indicating that un-duplicated
        (FALSE, default), duplicated (TRUE), or any (NA) reads should be
        returned. 'Duplicated' reads may represent PCR or optical duplicates.}
    \item{minMapq}{If quality scores exists, the minimum quality score
        required in order to keep a read, otherwise all reads are kept.}
    \item{pairedEnds}{A boolean value or vector specifying whether the BAM
        files contain paired-end data or not. Only affects the calculation of
        the expected variance.}
}

\value{
    Returns a \code{\link{QDNAseqReadCounts}} object with assay data element
    \code{counts} containing the binned read counts as non-negative \code{\link[base]{integer}}s.
}

\examples{
\dontrun{# read all files from the current directory with names ending in .bam
bins <- getBinAnnotations(15)
readCounts <- binReadCounts(bins)
}
}

\author{Ilari Scheinin, Daoud Sie}



\keyword{IO}
\keyword{file}
