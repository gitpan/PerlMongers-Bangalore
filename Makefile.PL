
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'We are the Bangalore Perl Mongers, find us at all the places listed below!
If you are in or around Bangalore near the first week of a month, do drop by for our meetups listed 
at bangalore.pm.org. Discuss this module at L<Bangalore.pm discussion page for this module|http://bangalore.pm.org/forum/6-module-plugins-frameworks-and-downloads/52-perlmongersbangalore.html>',
  'AUTHOR' => 'Shantanu Bhadoria <shantanu at cpan dott org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.47'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'PerlMongers-Bangalore',
  'EXE_FILES' => [],
  'LICENSE' => 'gpl',
  'NAME' => 'PerlMongers::Bangalore',
  'PREREQ_PM' => {
    'Acme::CPANAuthors' => '0',
    'Acme::CPANAuthors::Register' => '0'
  },
  'VERSION' => '0.03',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



